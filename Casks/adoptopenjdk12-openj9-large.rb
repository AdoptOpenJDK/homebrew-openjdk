cask 'adoptopenjdk12-openj9-large' do
  version '12.0.2,10'
  sha256 'f8868f99a63173e21fec8f95b9d194470e3fd8b7e48be2dc2fe8d11ae3444cbb'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10_openj9-0.15.1/OpenJDK12U-jdk_x64_mac_openj9_macosXL_12.0.2_10_openj9-0.15.1.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 12 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jdk_x64_mac_openj9_macosXL_12.0.2_10_openj9-0.15.1.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
