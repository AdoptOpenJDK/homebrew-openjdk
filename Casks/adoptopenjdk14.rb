# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14' do
  version '14.0.2,12'
  sha256 '9a5d065b47f98632fc9398d3d84086658af3cf8c1297ca1aa576db95918bca4d'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.2%2B12/OpenJDK14U-jdk_x64_mac_hotspot_14.0.2_12.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jdk_x64_mac_hotspot_14.0.2_12.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14.jdk'
end
