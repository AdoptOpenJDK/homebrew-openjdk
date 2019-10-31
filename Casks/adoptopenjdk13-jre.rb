cask 'adoptopenjdk13-jre' do
  version ''
  sha256 ''

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url ''
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg ''

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
