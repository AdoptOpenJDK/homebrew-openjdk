cask 'adoptopenjdk11-openj9-large' do
  version '11,0.3:7'
  sha256 '0a829da751a0d5aadb463574804afc11fffb3ee794a39b2ea14c68022b56d201'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7_openj9-0.14.3/OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.3_7_openj9-0.14.3.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.3_7_openj9-0.14.3.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}-openj9.jdk"
end
