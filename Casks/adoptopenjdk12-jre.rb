cask 'adoptopenjdk12-jre' do
  version '12,33'
  sha256 '1080b43328b8b21a2eb8b89d387f9a65cb9c7cbe4fc117dadd6e63256a9cac01'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk-#{version.before_comma}+#{version.after_comma.before_colon}/OpenJDK#{version.before_comma}U-jre_x64_mac_hotspot_#{version.before_comma}_#{version.after_comma.before_colon}#{version.after_colon}.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 12 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg "OpenJDK#{version.before_comma}U-jre_x64_mac_hotspot_#{version.before_comma}_#{version.after_comma.before_colon}#{version.after_colon}.pkg"

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jre",
                     ]
end
