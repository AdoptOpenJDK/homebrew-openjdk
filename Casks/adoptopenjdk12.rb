cask 'adoptopenjdk12' do
  version '12.0.2+10'
  sha256 '2cff36b04343762fe323f1bbbc2ca08c8116e6e8009fb166c30d57bf0bda1c82'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10/OpenJDK12U-jdk_x64_mac_hotspot_12.0.2_10.pkg'
  appcast 'https://github.com/adoptopenjdk/openjdk12-binaries/releases.atom'
  name 'AdoptOpenJDK 12'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jdk_x64_mac_hotspot_12.0.2_10.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12.jdk'
end
