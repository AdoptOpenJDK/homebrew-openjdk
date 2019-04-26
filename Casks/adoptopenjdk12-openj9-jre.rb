cask 'adoptopenjdk12-openj9-jre' do
  version '12.0.1+12'
  sha256 '8a2cdfc418cac8b44cff3ec787ec5ab5dbdbf5593aec9c837135e1a605ddadef'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.1%2B12_openj9-0.14.1/OpenJDK12U-jre_x64_mac_openj9_12.0.1_12_openj9-0.14.1.pkg'
  appcast 'https://github.com/adoptopenjdk/openjdk12-binaries/releases.atom'
  name 'AdoptOpenJDK 12 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jre_x64_mac_openj9_12.0.1_12_openj9-0.14.1.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12-openj9.jre'
end
