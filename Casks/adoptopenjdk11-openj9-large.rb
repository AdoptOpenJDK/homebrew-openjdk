cask 'adoptopenjdk11-openj9-large' do
  version '11.0.4,11'
  sha256 '87d2f460daeff88fd9c0c896578d358f49d0c87e3238abb22b289b5df1bd00e7'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.4%2B11.4_openj9-0.15.1/OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.4_11_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
