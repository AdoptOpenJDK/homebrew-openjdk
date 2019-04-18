cask 'adoptopenjdk8-openj9-jre' do
  version '8,212:b03'
  sha256 '219e1b7e3d1d019ce40f76b80b9f3b6db726b0e87a1a0a7f82700f071031a471'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b03_openj9-0.14.0/OpenJDK8U-jre_x64_mac_openj9_8u212b03_openj9-0.14.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_8u212b03_openj9-0.14.0.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                     ]
end
