cask 'adoptopenjdk10' do
  version '10,0.2:13'
  sha256 '5fe24ab7845005c94bddf5f28bd876b63a2a316f7ab757a5d1eddc24e229b7ae'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-releases/releases/download/jdk-#{version.before_comma}.#{version.after_comma.before_colon}%2B#{version.after_colon}/OpenJDK#{version.before_comma}_x64_Mac_jdk-#{version.before_comma}.#{version.after_comma.before_colon}.#{version.after_colon}.tar.gz"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name 'AdoptOpenJDK 10'
  homepage 'https://adoptopenjdk.net/'

  postflight do
    system_command '/bin/mv',
                   args: ['-f', '--', "#{staged_path}/jdk-#{version.before_comma}.#{version.after_comma.before_colon}+#{version.after_colon}",
                          "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk"],
                   sudo: true

    system_command '/bin/mkdir',
                   args: ['-p', '--', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Home/bundle/Libraries"],
                   sudo: true

    system_command '/bin/ln',
                   args: ['-nsf', '--', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Home/lib/server/libjvm.dylib",
                          "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Home/bundle/Libraries/libserver.dylib"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :CFBundleGetInfoString AdoptOpenJDK #{version.before_comma}+#{version.after_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :CFBundleIdentifier net.adoptopenjdk.#{version.before_comma}.jdk", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :CFBundleName AdoptOpenJDK #{version.before_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', "Set :JavaVM:JVMPlatformVersion #{version.before_comma}.#{version.after_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command '/usr/libexec/PlistBuddy',
                   args: ['-c', 'Set :JavaVM:JVMVendor AdoptOpenJDK', "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk"
end
