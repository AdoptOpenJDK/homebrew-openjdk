# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk8-openj9-large' do
  version '8,252:b09.2'
  sha256 '2b3024f12e9779d26c3b5900fc0d9b1ded10df6a413734d82c261f5c287acb48'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09.2_openj9-0.20.0/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u252b09_openj9-0.20.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8 (OpenJ9) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u252b09_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.8-openj9.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.8-openj9.jdk'
end
