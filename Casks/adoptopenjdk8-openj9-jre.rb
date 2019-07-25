cask 'adoptopenjdk8-openj9-jre' do
  version '8,222:b10'
  sha256 '1f7fd112e248125a7107472bca75d44963259737fd3fd11468ee66c0ce79e968'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10_openj9-0.15.1/OpenJDK8U-jre_x64_mac_openj9_8u222b10_openj9-0.15.1.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_8u222b10_openj9-0.15.1.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                     ]
end
