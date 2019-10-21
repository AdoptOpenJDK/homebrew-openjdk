cask 'adoptopenjdk11' do
  version '11.0.5,10'
  sha256 '35840dce2f1fc20613b1866740a8ead039c0a44620d84446c7afc874a56ca917'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10/OpenJDK11U-jdk_x64_mac_hotspot_11.0.5_10.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_hotspot_11.0.5_10.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jdk"
end
