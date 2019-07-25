cask 'adoptopenjdk12-jre' do
  version '12.0.2,10'
  sha256 'ebdf14af4766b89ac16db5d00e60757bcb8659c6d3887c1cd311f7ffacc8c42f'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10/OpenJDK12U-jre_x64_mac_hotspot_12.0.2_10.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 12 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jre_x64_mac_hotspot_12.0.2_10.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12.jre'
end
