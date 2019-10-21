cask 'adoptopenjdk11-jre' do
  version '11.0.5,10'
  sha256 'b2471ae98a3bac05c9d64e2bde6c3eff2ebf8aa8669db3996f9234bcd65bde31'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10/OpenJDK11U-jre_x64_mac_hotspot_11.0.5_10.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_hotspot_11.0.5_10.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
