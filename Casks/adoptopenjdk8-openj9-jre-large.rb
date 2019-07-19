cask 'adoptopenjdk8-openj9-jre-large' do
  version '8,222:b10'
  sha256 'd5a2203a169ed40a19177072ad2f4f62e2d694b3df108b87d6c146ff8744b71c'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10_openj9-0.15.1/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u222b10_openj9-0.15.1.pkg'
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK8U-jre_x64_mac_openj9_macosXL_8u222b10_openj9-0.15.1.pkg'

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                     ]
end
