cask 'adoptopenjdk13-openj9-jre-large' do
  version '13+33'
  sha256 'cd343a508263b1f7644bf3018ab659856af9e1fe348ab15f786e5e8854a7b80a'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk13-binaries/releases/download/jdk-13%2B33_openj9-0.16.0/OpenJDK13U-jre_x64_mac_openj9_macosXL_13_33_openj9-0.16.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK13U-jre_x64_mac_openj9_macosXL_13_33_openj9-0.16.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jre"
end
