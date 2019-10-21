#!/bin/bash set -eu

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
  for filename in *.rb; do
    echo "Checking $filename"
    case $filename in
      *openj9*) jvm_impl="openj9" ;;
      *) jvm_impl="hotspot" ;;
    esac

    case $filename in
      *jre*) type="jre" ;;
      *) type="jdk" ;;
    esac

    case $filename in
      *large.rb) heap="large" ;;
      *) heap="normal" ;;
    esac

    version=$(echo $filename | grep -Eo 'openjdk[0-9]{1,2}')

    cask_url=$(cat $filename | grep 'url ' | awk '{print $2}' | tr -d "'")
    case $cask_url in
      *.tar.gz*) echo "detected a tar.gz, skipping!" ;;
      *.pkg*)
        api_latest=$(curl --silent "https://api.adoptopenjdk.net/v2/latestAssets/releases/$version?openjdk_impl=$jvm_impl&os=mac&arch=x64&release=latest&type=$type&heap_size=$heap")
        api_url=$(echo $api_latest | grep -Eo '"installer_link":(\s+\S+){1}' | awk '{print $2}' | sed 's/,*$//g' | tr -d '"')
        if [ "$api_url" != "$cask_url" ]; then
          echo "Updating $filename"
          cask_sha256=$(cat $filename | grep 'sha256 ' | awk '{print $2}' | tr -d "'")
          api_sha256_link=$(echo $api_latest | grep -Eo '"installer_checksum_link":(\s+\S+){1}' | awk '{print $2}' | sed 's/,*$//g' | tr -d '"')
          api_sha256=$(curl -L --silent $api_sha256_link | awk '{print $1}')

          cask_installer_name=$(cat $filename | grep 'pkg ' | awk '{print $2}' | tr -d "'")
          api_installer_name=$(echo $api_latest | grep -Eo '"installer_name":(\s+\S+){1}' | awk '{print $2}' | sed 's/,*$//g' | tr -d '"')

          cask_version=$(cat $filename | grep 'version ' | awk '{print $2}' | tr -d "'")
          api_version=$(echo $api_latest | grep -Eo '"semver":(\s+\S+){1}' | awk '{print $2}' | sed 's/,*$//g' | tr -d '"' | sed 's/+/,/g')

          git checkout "$version-$jvm_impl-$type-$heap" || git checkout -b "$version-$jvm_impl-$type-$heap"
          git reset --hard upstream/master

          sed -i "s@${cask_url}@${api_url}@g" $filename
          sed -i "s@${cask_sha256}@${api_sha256}@g" $filename
          sed -i "s@${cask_installer_name}@${api_installer_name}@g" $filename
          sed -i "s@${cask_version}@${api_version}@g" $filename

          git add $filename
          git commit -m "update $filename to $api_version"
          git push -f fork "$version-$jvm_impl-$type-$heap"
          hub pull-request --base adoptopenjdk:master --head "$version-$jvm_impl-$type-$heap" -m "update $filename to $api_version"
        fi
    esac
  done
}

check_fork
check_hub

cd Casks

git fetch --all
git reset --hard upstream/master

update_casks

cd -
