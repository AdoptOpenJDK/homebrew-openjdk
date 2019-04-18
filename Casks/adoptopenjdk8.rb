cask 'adoptopenjdk8' do
  version '8,212:b03'
  sha256 'd0e4265b151d87235a74e354725fdc218d60abb06c253af0993fd2fcf4c3a355'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b03/OpenJDK8U-jdk_x64_mac_hotspot_8u212b03.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_hotspot_8u212b03.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jdk",
                     ]
end
