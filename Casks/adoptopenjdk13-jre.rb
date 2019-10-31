cask 'adoptopenjdk13-jre' do
  version '13.0.0,0'
  sha256 '1234'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://url'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'fake.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
