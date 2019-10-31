cask 'adoptopenjdk8-jre' do
  version '8,232:b09'
  sha256 'c4219c01085a84bb5a3d875eb438335ab68e3fe7af362a4121ad44d609ce7b43'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09/OpenJDK8U-jre_x64_mac_hotspot_8u232b09.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_hotspot_8u232b09.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jre",
                     ]
end
