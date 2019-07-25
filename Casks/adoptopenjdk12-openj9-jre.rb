cask 'adoptopenjdk12-openj9-jre' do
  version '12.0.2,10'
  sha256 '74f960d4522300d7b274060c278b01f5d405444ed7837ca2009325988d5ff295'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10_openj9-0.15.1/OpenJDK12U-jre_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 12 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jre_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12-openj9.jre'
end
