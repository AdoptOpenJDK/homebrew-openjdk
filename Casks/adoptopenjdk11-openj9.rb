cask 'adoptopenjdk11-openj9' do
  version '11,0.3:7'
  sha256 '9a36b284e9ae12dd34211f5684baecc90e97a380fbd63adca9ddb3826758cb34'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7_openj9-0.14.0/OpenJDK11U-jdk_x64_mac_openj9_11.0.3_7_openj9-0.14.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_11.0.3_7_openj9-0.14.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}-openj9.jdk"
end
