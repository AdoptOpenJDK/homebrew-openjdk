cask 'adoptopenjdk12-jre' do
  version '12.0.1+12'
  sha256 '47a536ff11faa18759d6178ae2df49d1b37394d85f25570f6b72a09571d37cb2'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.1%2B12/OpenJDK12U-jre_x64_mac_hotspot_12.0.1_12.pkg'
  appcast 'https://github.com/adoptopenjdk/openjdk12-binaries/releases.atom'
  name 'AdoptOpenJDK 12 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jre_x64_mac_hotspot_12.0.1_12.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12.jre'
end
