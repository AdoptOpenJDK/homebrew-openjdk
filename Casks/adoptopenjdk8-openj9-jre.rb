cask 'adoptopenjdk8-openj9-jre' do
  version '8,202:b08'
  sha256 'c2c6f6bfbfdce5794d98fbb23bcb96eebd979f3fdc3935f1c11e57606cbdec85'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk#{version.before_comma}u#{version.after_comma.before_colon}-#{version.after_colon}_openj9-0.12.1/OpenJDK#{version.before_comma}U-jre_x64_mac_openj9_#{version.before_comma}u#{version.after_comma.before_colon}#{version.after_colon}_openj9-0.12.1.tar.gz"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  postflight do
    system_command '/bin/mv',
                   args: [
                           '-f', '--', "#{staged_path}/jdk#{version.before_comma}u#{version.after_comma.before_colon}-#{version.after_colon}-jre",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre"
                         ],
                   sudo: true

    system_command '/bin/mkdir',
                   args: ['-p', '--', '/Library/Java/JavaVirtualMachines/adoptopenjdk-8-openj9.jre/Contents/Home/bundle/Libraries'],
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
                           '-c', "Set :CFBundleGetInfoString AdoptOpenJDK (OpenJ9, JRE) 1.#{version.before_comma}.0_#{version.after_comma.before_colon}",
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
                           '-c', "Set :CFBundleName AdoptOpenJDK #{version.before_comma} (OpenJ9, JRE)",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}-openj9.jre/Contents/Info.plist"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: [
                           '-c', "Set :JavaVM:JVMPlatformVersion 1.#{version.before_comma}.0_#{version.after_comma.before_colon}",
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
