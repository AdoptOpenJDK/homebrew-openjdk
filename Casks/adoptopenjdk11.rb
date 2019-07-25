cask 'adoptopenjdk11' do
  version '11.0.4,11'
  sha256 '28c3e4d85ea09b8a5428ab5c5a43da25d777b256748b8c12453627ff91838c05'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11/OpenJDK11U-jdk_x64_mac_hotspot_11.0.4_11.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_hotspot_11.0.4_11.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}.jdk"
end
