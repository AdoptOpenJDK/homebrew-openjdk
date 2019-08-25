cask 'adoptopenjdk11-jre' do
  version '11.0.4,11'
  sha256 '66819d47857a460023ecdba31bac21330368f8d81706652846f79db447405814'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.4/OpenJDK11U-jre_x64_mac_hotspot_11.0.4_11.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_hotspot_11.0.4_11.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
