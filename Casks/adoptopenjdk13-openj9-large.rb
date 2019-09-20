cask 'adoptopenjdk13-openj9-large' do
  version '13+33'
  sha256 'ab8456a3784edadcf3ff4d20f7482218648b8ec1a70ab5164a25ba9030abc1fc'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13%2B33_openj9-0.16.0/OpenJDK13U-jdk_x64_mac_openj9_macosXL_13_33_openj9-0.16.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  _13_33
  pkg 'OpenJDK13U-jdk_x64_mac_openj9_macosXL_13_33_openj9-0.16.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
