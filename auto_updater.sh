#!/bin/bash set -eu

PUSH=
FORCE=

for i in "$@"
do
case $i in
    # Perform all git commands, Do not use locally
    --push)
      PUSH="true"
      BRANCH=$(date +"%Y-%m-%d")
    ;;
    # Force update the cask even if it's already got the latest version
    --force)
      FORCE="true"
    ;;
esac
done

function check_fork {
  git ls-remote --exit-code fork > /dev/null 2>&1
  if test $? = 1; then
    git remote add fork git@github.com:adoptopenjdk-github-bot/homebrew-openjdk.git
  fi
}

function check_hub {
  command -v hub > /dev/null 2>&1
  if test $? = 1; then
    echo "Installing hub"
    os=$(uname | awk '{print tolower($0)}')
    wget --quiet "https://github.com/github/hub/releases/download/v2.12.3/hub-$os-amd64-2.12.3.tgz"
    tar -xf hub-$os-amd64-2.12.3.tgz
    export PATH="$PWD/hub-$os-amd64-2.12.3/bin:$PATH"
    rm -rf hub-$os-amd64-2.12.3.tgz
  fi
  # Check that hub is in the PATH
  which hub
}

function update_casks {
  cd Casks

  if [ "$PUSH" == "true" ]; then
    git fetch --all
    git checkout "$BRANCH" || git checkout -b "$BRANCH"
    git reset --hard upstream/master
  fi

  cat ../casks.txt | while read cask 
  do
    if [[ "$cask" != \#* ]]; then
      echo "Checking $cask"
      case $cask in
        *openj9*) jvm_impl="openj9" ;;
        *) jvm_impl="hotspot" ;;
      esac

      case $cask in
        *jre*) type="jre" ;;
        *) type="jdk" ;;
      esac

      case $cask in
        *large) heap="large" ;;
        *) heap="normal" ;;
      esac

      # Obtain the latest major release from the api (most_recent_feature_release) for
      # non-versioned casks. For versioned casks, the major release is extracted from the file
      # name. 
      case $cask in
        *jdk-jre|*jdk-openj9|*jdk-openj9-jre|*jdk-openj9-large|*jdk-openj9-jre-large)
          api_release_info=$(curl --silent https://api.adoptopenjdk.net/v3/info/available_releases)
          version=$(echo $api_release_info | python3 -c "import sys, json; print(json.load(sys.stdin)['most_recent_feature_release'])")
          ;;
        *)
          version=$(echo $cask | grep -Eo 'openjdk[0-9]{1,2}')
          ;;
      esac

      # Create new cask of if it doesn't already exist
      if [[ ! -f $cask.rb ]]; then
        echo "Creating new cask: $cask.rb"
        cp ../Templates/adoptopenjdk.rb.tmpl $cask.rb
      fi

      cask_url=$(cat $cask.rb | grep 'url ' | awk '{print $2}' | tr -d '"')
      case $cask_url in
        *.tar.gz*) echo "detected a tar.gz, skipping!" ;;
        *)
          api_latest=$(curl --silent "https://api.adoptopenjdk.net/v3/assets/feature_releases/${version//[!0-9]/}/ga?architecture=x64&heap_size=$heap&image_type=$type&jvm_impl=$jvm_impl&os=mac&page=0&page_size=1&vendor=adoptopenjdk")
          is_installer=$(echo $api_latest | grep installer)

          if [ -z "$is_installer" ]; then
            echo "Skipping because no pkg available"
          else
            api_url=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['binaries'][0]['installer']['link'])")

            if [ "$api_url" != "$cask_url" ] || [ "$FORCE" == "true" ]; then
              echo "Updating $cask"
              api_sha256=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['binaries'][0]['installer']['checksum'])")

              api_installer_name=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['binaries'][0]['installer']['name'])")
              release_name=$(echo $api_url | awk '{split($0,a,"/"); print a[8]}')
              if [ $version == "openjdk8" ]; then
                security=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['security'])")
                build=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['openjdk_version'])" | cut -d "-" -f 2)
                adopt_build_number=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['adopt_build_number'])") || ""
                api_version="8,$security:$build"
                if [ "$adopt_build_number" != "" ]; then
                  api_version="$api_version.$adopt_build_number"
                fi
                livecheck="https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
                url="https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/${release_name}/${api_installer_name}"
              else
                minor=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['minor'])")
                adopt_build_number=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['adopt_build_number'])") || ""
                if [ "$minor" == 0 ]; then
                  api_version=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['openjdk_version'])" | sed 's/+/,/g')
                else
                  api_version=$(echo $api_latest | python3 -c "import sys, json; print(json.load(sys.stdin)[0]['version_data']['semver'])" | sed 's/+/,/g')
                fi
                if [ "$adopt_build_number" != "" ]; then
                  api_version="$api_version.$adopt_build_number"
                fi
                livecheck="https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
                url="https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/${release_name}/${api_installer_name}"
              fi

              name="AdoptOpenJDK ${version//[!0-9]/}"
              identifier="net.adoptopenjdk.${version//[!0-9]/}"

              if [ "$jvm_impl" == "openj9" ]; then
                name+=" (OpenJ9)"
                identifier+="-openj9"
              fi

              if [ "$type" == "jre" ]; then
                name+=" (JRE)"
                identifier+=".jre"
              else 
                identifier+=".jdk"
              fi

              if [ "$heap" == "large" ]; then
                name+=" (XL)"
              fi

              cat ../Templates/adoptopenjdk.rb.tmpl  \
              | sed -E "s/\\{cask_name\\}/${cask%.*}/g" \
              | sed -E "s/\\{version_number\\}/$api_version/g" \
              | sed -E "s/\\{shasum\\}/$api_sha256/g" \
              | sed -E "s|\\{cask_url\\}|$url|g" \
              | sed -E "s|\\{livecheck\\}|$livecheck|g" \
              | sed -E "s/\\{name\\}/$name/g" \
              | sed -E "s/\\{filename\\}/$api_installer_name/g" \
              | sed -E "s/\\{identifier\\}/$identifier/g" \
              >$cask.rb ; \

              if [ "$PUSH" == "true" ]; then
                git add $cask.rb
                git commit -m "update $cask to $api_version"
              fi
            fi
          fi
        ;;
      esac
    fi
  done
  if [ "$PUSH" == "true" ]; then
    git push -f fork "$BRANCH"
    hub pull-request --base adoptopenjdk:master --head "$BRANCH" -m "update Casks"
  fi
}

if [ "$PUSH" == "true" ]; then
  check_fork
  check_hub
fi

update_casks

cd -
