cask 'adoptopenjdk8-openj9-jre-large' do
  version '8,"8.0.232+9",:"8.0.232+9"'
  sha256 '303f305e234fc25ef86c9be9a85b6707b48a2f8aa46ed3a89706992b800788f8'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09_openj9-0.17.0/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u232b09_openj9-0.17.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_macosXL_8u232b09_openj9-0.17.0.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                     ]
end
