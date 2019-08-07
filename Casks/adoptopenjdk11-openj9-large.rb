cask 'adoptopenjdk11-openj9-large' do
  version '11.0.4,11'
  sha256 '72424c40d3ace2a88116a7cc66f31c8011cf8f59e62c9cbbad8ae46c1a40ff2d'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.2_openj9-0.15.1/OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
