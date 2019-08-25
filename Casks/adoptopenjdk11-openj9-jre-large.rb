cask 'adoptopenjdk11-openj9-jre-large' do
  version '11.0.4,11'
  sha256 'f5ae4105d5c7408be4d93486cdd2061144f43b33f98fe9ce3b32711451915a45'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.4_openj9-0.15.1/OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9 JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jre"
end
