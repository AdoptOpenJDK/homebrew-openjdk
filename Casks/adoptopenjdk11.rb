cask 'adoptopenjdk11' do
  version '11.0.4,11'
  sha256 '555fd51cb60aa37967db48ee1bd6ec184dd2c2fbf045493f16203c1ca4494359'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.4/OpenJDK11U-jdk_x64_mac_hotspot_11.0.4_11.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_hotspot_11.0.4_11.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jdk"
end
