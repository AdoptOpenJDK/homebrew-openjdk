cask 'adoptopenjdk11-jre' do
  version '11.0.4,11'
  sha256 '689511057edac26f8b0b1fd8ef51473c01db30fd47203737940ca0581b94c003'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.2/OpenJDK11U-jre_x64_mac_hotspot_11.0.4_11.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_hotspot_11.0.4_11.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
