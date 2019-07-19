cask 'adoptopenjdk8-jre' do
  version '8,222:b10'
  sha256 'a67ff13b3447b261b304972486cf84149745fb466d88b46253f12878be68605e'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10/OpenJDK8U-jre_x64_mac_hotspot_8u222b10.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_hotspot_8u222b10.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jre",
                     ]
end
