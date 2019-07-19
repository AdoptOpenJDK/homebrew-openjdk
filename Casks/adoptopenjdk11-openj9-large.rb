cask 'adoptopenjdk11-openj9-large' do
  version '11,0.4:11'
  sha256 'f8868f99a63173e21fec8f95b9d194470e3fd8b7e48be2dc2fe8d11ae3444cbb'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11_openj9-0.15.1/OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.before_comma}-openj9.jdk"
end
