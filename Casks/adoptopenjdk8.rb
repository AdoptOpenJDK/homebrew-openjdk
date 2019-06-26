cask 'adoptopenjdk8' do
  version '8,212:b04'
  sha256 '20c4d9d3c0b10c21f781ba3a723683c70805e61939f908522cbce76e6e1ed2af'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b04/OpenJDK8U-jdk_x64_mac_hotspot_8u212b04.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_hotspot_8u212b04.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jdk",
                     ]
end
