cask 'adoptopenjdk8' do
  version '8,222:b10'
  sha256 '9605fd00d2960934422437f601c7a9a1c5537309b9199d5bc75f84f20cd29a76'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10/OpenJDK8U-jdk_x64_mac_hotspot_8u222b10.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_hotspot_8u212b04.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jdk",
                     ]
end
