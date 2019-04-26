cask 'adoptopenjdk12-openj9' do
  version '12.0.1+12'
  sha256 '2b8ec4869cb9aad08ab6fe8e7e20a1877b547ef594db4968cde2dcd0adfde2a7'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.1%2B12_openj9-0.14.1/OpenJDK12U-jdk_x64_mac_openj9_12.0.1_12_openj9-0.14.1.pkg'
  appcast 'https://github.com/adoptopenjdk/openjdk12-binaries/releases.atom'
  name 'AdoptOpenJDK 12 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK12U-jdk_x64_mac_openj9_12.0.1_12_openj9-0.14.1.pkg'

  uninstall pkgutil: 'net.adoptopenjdk.12-openj9.jdk'
end
