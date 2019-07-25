cask 'adoptopenjdk11-openj9-jre' do
  version '11.0.4,11'
  sha256 'debeeb36f739f11ee0e484be6c40eaf02989e605c02f6d16bcf47b7f813bca5a'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11_openj9-0.15.1/OpenJDK11U-jre_x64_mac_openj9_11.0.4_11_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_11.0.4_11_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}-openj9.jre"
end
