cask 'adoptopenjdk11' do
  version '11,0.3:7'
  sha256 '8e8e4373b59828293f2035c4cb4bb2758a26adc6b30ab28f383248e04983f9a7'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7/OpenJDK11U-jdk_x64_mac_hotspot_11.0.3_7.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 11'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_hotspot_11.0.3_7.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}.jdk"
end
