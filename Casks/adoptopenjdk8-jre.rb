# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk8-jre' do
  version '8.0.252,9.1'
  sha256 'aba3f24e233f4f82cf8bdee891b4b891d176e7074fb4cea53d1cf7446ed18171'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09.1/OpenJDK8U-jre_x64_mac_hotspot_8u252b09.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 8 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_hotspot_8u252b09.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.8.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.8.jre'
end
