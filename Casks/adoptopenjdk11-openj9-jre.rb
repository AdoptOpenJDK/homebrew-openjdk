cask 'adoptopenjdk11-openj9-jre' do
  version '11,0.3:7'
  sha256 '150c4065a57ec368b692276e8e3320b183ee17b402b7db07e676dff5837f0c52'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-#{version.before_comma}.#{version.after_comma.before_colon}%2B#{version.after_colon}_openj9-0.14.0/OpenJDK11U-jre_x64_mac_openj9_#{version.before_comma}.#{version.after_comma.before_colon}_#{version.after_colon}_openj9-0.14.0.tar.gz"
  appcast 'https://github.com/adoptopenjdk/openjdk11-binaries/releases.atom'
  name 'AdoptOpenJDK 11 (OpenJ9 JRE)'
  homepage 'https://adoptopenjdk.net/'

  postflight do
    system_command '/bin/mv',
                   args: [
                           '-f', '--', "#{staged_path}/jdk-#{version.before_comma}.#{version.after_comma.before_colon}+#{version.after_colon}-jre",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre"
                         ],
                   sudo: true

    system_command '/bin/mkdir',
                   args: [
                           '-p', '--', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Home/bundle/Libraries"
                         ],
                   sudo: true

    system_command '/bin/ln',
                   args: [
                           '-nsf', '--',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Home/lib/server/libjvm.dylib",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Home/bundle/Libraries/libserver.dylib"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :CFBundleGetInfoString AdoptOpenJDK (OpenJ9 JRE) #{version.before_comma}.#{version.after_comma.before_colon}+#{version.after_colon}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :CFBundleIdentifier net.adoptopenjdk.#{version.before_comma}-openj9.jre",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :CFBundleName AdoptOpenJDK (OpenJ9 JRE) #{version.before_comma}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :JavaVM:JVMPlatformVersion #{version.before_comma}.#{version.after_comma.before_colon}+#{version.after_colon}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', 'Set :JavaVM:JVMVendor AdoptOpenJDK',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', 'Add :JavaVM:JVMCapabilities array',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', 'Add :JavaVM:JVMCapabilities:0 string CommandLine',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre"
end
