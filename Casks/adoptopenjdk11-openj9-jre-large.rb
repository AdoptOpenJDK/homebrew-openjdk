cask 'adoptopenjdk11-openj9-jre-large' do
  version '11.0.5,10'
  sha256 '9637e51d38fdb1f82120aee5ba67570b8f2aed076c6f6f29cfd89c0d9d046743'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10.1_openj9-0.17.0/OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.5_10_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9 JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.5_10_openj9-0.17.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jre"
end
