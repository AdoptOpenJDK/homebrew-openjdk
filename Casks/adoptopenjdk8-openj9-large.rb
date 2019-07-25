cask 'adoptopenjdk8-openj9-large' do
  version '8,222:b10'
  sha256 '929da901d7a5a2abf243ed9dc5a0e540d89fb28fe80cc1d50c2ef135148b69db'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10_openj9-0.15.1/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u222b10_openj9-0.15.1.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u222b10_openj9-0.15.1.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jdk",
                     ]
end
