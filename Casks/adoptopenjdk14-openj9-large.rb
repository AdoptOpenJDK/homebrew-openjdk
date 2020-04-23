# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14-openj9-large' do
  version '14.0.1,7.1'
  sha256 '93b37717b18d000f26f3ae2e983391b5fbe97573691bf022f8ea953dec473047'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.1%2B7.1_openj9-0.20.0/OpenJDK14U-jdk_x64_mac_openj9_macosXL_14.0.1_7_openj9-0.20.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jdk_x64_mac_openj9_macosXL_14.0.1_7_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jdk'
end
