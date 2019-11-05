cask 'adoptopenjdk11-openj9' do
  version '11.0.5,10'
  sha256 '2ee5e4ee14689c57bc3ae8c57705b4528bf8eaf602535f5e8abd0a3a839be787'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10.1_openj9-0.17.0/OpenJDK11U-jdk_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 11 (OpenJ9)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK11U-jdk_x64_mac_openj9_11.0.5_10_openj9-0.17.0.pkg'

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
