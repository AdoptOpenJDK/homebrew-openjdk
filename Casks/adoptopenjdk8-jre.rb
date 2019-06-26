cask 'adoptopenjdk8-jre' do
  version '8,212:b04'
  sha256 '6d0a03c4aef15a7bf1889a029c63a74391cc835b4b1bb46136029b9cbe57a033'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b04/OpenJDK8U-jre_x64_mac_hotspot_8u212b04.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_hotspot_8u212b04.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jre",
                     ]
end
