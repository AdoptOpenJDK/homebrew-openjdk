cask 'adoptopenjdk8-jre' do
  version '8,202:b08'
  sha256 '0c80cc5c18b3cedefa3e1bda9dda0fdd0ec5d3bc1d96ffbfc72d710ea60a49e5'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk#{version.before_comma}u#{version.after_comma.before_colon}-#{version.after_colon}/OpenJDK#{version.before_comma}U-jre_x64_mac_hotspot_#{version.before_comma}u#{version.after_comma.before_colon}#{version.after_colon}.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  pkg "OpenJDK#{version.before_comma}U-jre_x64_mac_hotspot_#{version.before_comma}u#{version.after_comma.before_colon}#{version.after_colon}.pkg"

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}.jre",
                     ]
end
