cask 'adoptopenjdk11-openj9-jre' do
  version '11,0.3:7'
  sha256 '0d127d145ea21d69638bd1344a738d82ff4fe167d35500fb518a5a79e12a9688'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7_openj9-0.14.0/OpenJDK11U-jre_x64_mac_openj9_11.0.3_7_openj9-0.14.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 11 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_11.0.3_7_openj9-0.14.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}-openj9.jre"
end
