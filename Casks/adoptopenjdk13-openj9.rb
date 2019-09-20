cask 'adoptopenjdk13-openj9' do
  version '13+33'
  sha256 'ba2282dd0f2a5d0098ee12c45f1c387ff73cbaa9cbdd9474c7354069b18f4163'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13%2B33_openj9-0.16.0/OpenJDK13U-jdk_x64_mac_openj9_13_33_openj9-0.16.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK13U-jdk_x64_mac_openj9_13_33_openj9-0.16.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
