# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14-openj9' do
  version '14.0.1,7.2'
  sha256 'fd88e3a4fd5e3b39c69079a34765ee6c7c73ba9d2510bd9c698126fff81bab54'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.1%2B7.2_openj9-0.20.0/OpenJDK14U-jdk_x64_mac_openj9_14.0.1_7_openj9-0.20.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jdk_x64_mac_openj9_14.0.1_7_openj9-0.20.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jdk'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jdk'
end
