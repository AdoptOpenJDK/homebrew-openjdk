cask 'adoptopenjdk8-jre' do
  version '8,202:b08'
  sha256 'd7be3dfd5cd10323e1272e06d26f0709fbbc4a6f25a3992c2f2eef7022517fba'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk#{version.before_comma}u#{version.after_comma.before_colon}-#{version.after_colon}/OpenJDK#{version.before_comma}U-jre_x64_mac_hotspot_#{version.before_comma}u#{version.after_comma.before_colon}#{version.after_colon}.tar.gz"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 8'
  homepage 'https://adoptopenjdk.net/'

  postflight do
    system_command '/bin/mv',
                   args: [
                           '-f', '--', "#{staged_path}/jdk#{version.before_comma}u#{version.after_comma.before_colon}-#{version.after_colon}",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre"
                         ],
                   sudo: true

    system_command '/bin/mkdir',
                   args: ['-p', '--', '/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bundle/Libraries'],
                   sudo: true

    system_command '/bin/ln',
                   args: [
                           '-nsf', '--', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Home/lib/server/libjvm.dylib",
                           "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Home/bundle/Libraries/libserver.dylib"
                         ],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :CFBundleGetInfoString AdoptOpenJDK 1.#{version.before_comma}.0_#{version.after_comma.before_colon}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :CFBundleIdentifier net.adoptopenjdk.#{version.before_comma}.jdk", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :CFBundleName AdoptOpenJDK #{version.before_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :JavaVM:JVMPlatformVersion 1.#{version.before_comma}.0_#{version.after_comma.before_colon}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', 'Set :JavaVM:JVMVendor AdoptOpenJDK', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre/Contents/Info.plist"],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jre"
end
