cask 'adoptopenjdk13-jre' do
  version '13+33'
  sha256 'f673cfc7673ce9b3704e9bb2149b49529968ce2d8247ec745c4d49abf147bbd4'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13%2B33/OpenJDK13U-jre_x64_mac_hotspot_13_33.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK13U-jre_x64_mac_hotspot_13_33.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
