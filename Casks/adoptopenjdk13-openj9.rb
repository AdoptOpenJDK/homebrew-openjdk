cask 'adoptopenjdk13-openj9' do
  version '13.0.1,9'
  sha256 'ed86efd4c4e2dca96f05053ce2b17b0eaaf892bee98a1f634ed672dbf2e82ae4'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13.0.1%2B9.1_openj9-0.17.0/OpenJDK13U-jdk_x64_mac_openj9_13.0.1_9_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK13U-jdk_x64_mac_openj9_13.0.1_9_openj9-0.17.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
