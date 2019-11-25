# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk11-openj9-jre' do
  version '11.0.5,10'
  sha256 'd37598ebfd0e96b75593252c3e875c3520dac356e0eda69677c046def2f24828'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10.1_openj9-0.17.0/OpenJDK11U-jre_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9) (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jre_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.11-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.11-openj9.jre'
end
