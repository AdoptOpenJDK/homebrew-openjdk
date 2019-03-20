cask 'adoptopenjdk12-openj9' do
  version '12,33'
  sha256 'b8ecd09764d36dcc647f7fe0b109a97f63f73676f5de3ed834e8b929fc15b383'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk-#{version.before_comma}+#{version.after_comma.before_colon}_openj9-0.13.0/OpenJDK#{version.before_comma}U-jdk_x64_mac_openj9_#{version.before_comma}_#{version.after_comma.before_colon}#{version.after_colon}_openj9-0.13.0.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 12 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg "OpenJDK#{version.before_comma}U-jdk_x64_mac_openj9_#{version.before_comma}_#{version.after_comma.before_colon}#{version.after_colon}_openj9-0.13.0.pkg"

  uninstall pkgutil: [
                       "net.adoptopenjdk.#{version.before_comma}-openj9.jdk",
                     ]
end
