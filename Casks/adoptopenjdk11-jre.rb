cask 'adoptopenjdk11-jre' do
  version '11,0.3:7'
  sha256 'd252a9a17dbf68cbd5a0073a016232ece78bf8ff81b7576301e2e942e5fa248b'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7/OpenJDK11U-jre_x64_mac_hotspot_11.0.3_7.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 11 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_hotspot_11.0.3_7.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}.jre"
end
