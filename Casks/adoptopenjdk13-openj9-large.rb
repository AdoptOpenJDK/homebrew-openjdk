cask 'adoptopenjdk13-openj9-large' do
  version '13.0.1,9'
  sha256 '44030e75513cf9c584c942ec1f5a04ed31e5aa2c775d7fc416985c26e88f1e16'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13.0.1%2B9_openj9-0.17.0/OpenJDK13U-jdk_x64_mac_openj9_macosXL_13.0.1_9_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK13U-jdk_x64_mac_openj9_macosXL_13.0.1_9_openj9-0.17.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
