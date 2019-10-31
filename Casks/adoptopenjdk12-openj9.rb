cask 'adoptopenjdk12-openj9' do
  version '12.0.2,10.3'
  sha256 ''

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url ''
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 12 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg ''

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
