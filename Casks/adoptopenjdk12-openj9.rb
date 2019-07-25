cask 'adoptopenjdk12-openj9' do
  version '12.0.2,10'
  sha256 '71f0d8ae7bbb398efa345e807440a22add33cb131b52610050ca4d72d338a879'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10_openj9-0.15.1/OpenJDK12U-jdk_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 12 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jdk_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12-openj9.jdk'
end
