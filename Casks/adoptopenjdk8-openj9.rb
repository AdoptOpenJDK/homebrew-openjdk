cask 'adoptopenjdk8-openj9' do
  version '8,202:b08'
  sha256 :no_check

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk#{version.before_comma}u#{version.after_comma.before_colon}-#{version.after_colon}_openj9-0.12.1/OpenJDK#{version.before_comma}U-jdk_x64_mac_openj9_#{version.before_comma}u#{version.after_comma.before_colon}#{version.after_colon}_openj9-0.12.1.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg "OpenJDK#{version.before_comma}U-jdk_x64_mac_openj9_#{version.before_comma}u#{version.after_comma.before_colon}#{version.after_colon}_openj9-0.12.1.pkg"

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jdk",
                     ]
end
