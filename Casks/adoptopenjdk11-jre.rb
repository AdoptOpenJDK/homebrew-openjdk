cask 'adoptopenjdk11-jre' do
  version '11,0.3:7'
  sha256 '9523b97288ff5d50e404565d346ed8ea8f19dd155092951af88d4be6b8414776'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-#{version.before_comma}.#{version.after_comma.before_colon}%2B#{version.after_colon}/OpenJDK11U-jre_x64_mac_hotspot_#{version.before_comma}.#{version.after_comma.before_colon}_#{version.after_colon}.tar.gz"
  appcast 'https://github.com/adoptopenjdk/openjdk11-binaries/releases.atom'
  name 'AdoptOpenJDK 11 (JRE)'
  homepage 'https://adoptopenjdk.net/'

  postflight do
    system_command '/bin/mv',
                   args: [
                           '-f', '--', "#{staged_path}/jdk-#{version.before_comma}.#{version.after_comma.before_colon}+#{version.after_colon}-jre",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre"
                         ],
                   sudo: true

    system_command '/bin/mkdir',
                   args: [
                           '-p', '--', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Home/bundle/Libraries"
                         ],
                   sudo: true

    system_command '/bin/ln',
                   args: [
                           '-nsf', '--',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Home/lib/server/libjvm.dylib",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Home/bundle/Libraries/libserver.dylib"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :CFBundleGetInfoString AdoptOpenJDK (JRE) #{version.before_comma}.#{version.after_comma.before_colon}+#{version.after_colon}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :CFBundleIdentifier net.adoptopenjdk.#{version.before_comma}.jre",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :CFBundleName AdoptOpenJDK (JRE) #{version.before_comma}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :JavaVM:JVMPlatformVersion #{version.before_comma}.#{version.after_comma.before_colon}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', 'Set :JavaVM:JVMVendor AdoptOpenJDK',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', 'Add :JavaVM:JVMCapabilities array',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', 'Add :JavaVM:JVMCapabilities:0 string CommandLine',
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"
                         ],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre"
end
