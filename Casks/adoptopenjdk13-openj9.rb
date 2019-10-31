cask 'adoptopenjdk13-openj9' do
  version ''
  sha256 ''

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://url'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 13 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'fake.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
