cask 'adoptopenjdk8-openj9-jre' do
  version '8,"8.0.232+9",:"8.0.232+9"'
  sha256 'e33adb8b94ae92b296b5bd3c4d17580d2e702d1ea34ecc6dda3e88d273f64ab8'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u232-b09_openj9-0.17.0/OpenJDK8U-jre_x64_mac_openj9_8u232b09_openj9-0.17.0.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_8u232b09_openj9-0.17.0.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                     ]
end
