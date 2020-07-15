# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk-openj9-jre-large' do
  version '14.0.1,7.2'
  sha256 'dc22a154b869f2e483f253f7e5d3a19ee8868ebcee2f19ad9efba77973692148'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.1%2B7.2_openj9-0.20.0/OpenJDK14U-jre_x64_mac_openj9_macosXL_14.0.1_7_openj9-0.20.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9) (JRE) (XL)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jre_x64_mac_openj9_macosXL_14.0.1_7_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jre'
end
