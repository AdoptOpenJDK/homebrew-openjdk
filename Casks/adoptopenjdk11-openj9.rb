cask 'adoptopenjdk11-openj9' do
  version '11.0.4,11'
  sha256 'f3140b387aae1f7a08cc6b903863ba960c78473ddc98e4233b09d4dbc7e6fb6f'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.2_openj9-0.15.1/OpenJDK11U-jdk_x64_mac_openj9_11.0.4_11_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_11.0.4_11_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
