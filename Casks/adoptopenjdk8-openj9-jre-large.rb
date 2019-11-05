cask 'adoptopenjdk8-openj9-jre-large' do
  version '8,232:b09'
  sha256 '369a0af9bef951ee94071321ed0cca0850d237c8b0fa9e93a2a4201733280fe4'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09.1_openj9-0.17.0/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u232b09_openj9-0.17.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_macosXL_8u232b09_openj9-0.17.0.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                     ]
end
