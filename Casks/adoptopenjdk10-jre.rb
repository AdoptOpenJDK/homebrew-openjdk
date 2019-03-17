cask 'adoptopenjdk10-jre' do
  version '10,0.2:13'
  sha256 '6dbbf9ad8b7bdcf1403946312978e7b8831b5b9d2fda67959e78fb76b456a08c'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk-#{version.before_comma}.#{version.after_comma.before_colon}%2B#{version.after_colon}/OpenJDK#{version.before_comma}U-jre_x64_mac_hotspot_#{version.before_comma}.#{version.after_comma.before_colon}_#{version.after_colon}.tar.gz"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 10 (JRE)'
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
                           '-c', "Set :CFBundleGetInfoString AdoptOpenJDK (JRE) #{version.before_comma}+#{version.after_comma}",
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
                           '-c', "Set :JavaVM:JVMPlatformVersion #{version.before_comma}.#{version.after_comma}",
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
