cask 'adoptopenjdk8-openj9-large' do
  version '8,212:b04'
  sha256 'a0f82d276af4c7419b681330e24a82a53b32a9cc0b8473e7ca5350df0275248e'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b04_openj9-0.14.2/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u212b04_openj9-0.14.2.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u212b04_openj9-0.14.2.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jdk",
                     ]
end
