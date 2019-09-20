cask 'adoptopenjdk13' do
  version '13+33'
  sha256 '146c83e02e3ea058f93470c8e3b32bfa01e288175723e615c60a993e98b159fc'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13%2B33/OpenJDK13U-jdk_x64_mac_hotspot_13_33.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK13U-jdk_x64_mac_hotspot_13_33.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jdk"
end
