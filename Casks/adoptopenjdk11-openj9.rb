cask 'adoptopenjdk11-openj9' do
  version '11.0.5,10'
  sha256 '336c9137b907730b2869da968b67234b4619a282e4cfb5b843c2aff42043bc2e'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10_openj9-0.17.0/OpenJDK11U-jdk_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
