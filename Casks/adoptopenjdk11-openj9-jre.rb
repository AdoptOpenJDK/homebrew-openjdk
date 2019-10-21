cask 'adoptopenjdk11-openj9-jre' do
  version '11.0.5,10'
  sha256 '1c80c1a8d6f96d0cf01eeb3d1558daabbfaa05ebe14c53a27173e9c5c4a91432'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10_openj9-0.17.0/OpenJDK11U-jre_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jre"
end
