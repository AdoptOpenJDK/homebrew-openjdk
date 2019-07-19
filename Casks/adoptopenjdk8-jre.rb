cask 'adoptopenjdk8-jre' do
  version '8,222:b10'
  sha256 'b3ac2436534cea932ccf665b317dbf5ffc0ee065efca808b22b6c2d795ca1b90'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10/OpenJDK8U-jre_x64_mac_hotspot_8u222b10.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_hotspot_8u212b04.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jre",
                     ]
end
