cask 'adoptopenjdk8-openj9-large' do
  version '8,232:b09_openj9-0.17.0'
  sha256 '17db106cae9d4e26dc1135c5ff811832873978a912c7693afbbba8438d2e6819'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09_openj9-0.17.0/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u232b09_openj9-0.17.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u232b09_openj9-0.17.0.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jdk",
                     ]
end
