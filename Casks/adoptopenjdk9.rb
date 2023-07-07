cask "adoptopenjdk9" do
  version "9,181"
  sha256 "bbe348baab3cca097b77f7fff6c8465858e642ad42c5851bde33a1553ca12653"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.csv.first}-binaries/releases/download/jdk-#{version.csv.first}%2B#{version.csv.second}/OpenJDK#{version.csv.first}U-jdk_x64_mac_hotspot_#{version.csv.first}_#{version.csv.second}.tar.gz", verified: "https://github.com/AdoptOpenJDK"
  livecheck "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases.atom"
  name "AdoptOpenJDK 9"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  postflight do
    system_command "/bin/mv",
                   args: ["-f", "--", "#{staged_path}/jdk-#{version.before_comma}+#{version.after_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk"],
                   sudo: true

    system_command "/bin/mkdir",
                   args: ["-p", "--", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Home/bundle/Libraries"],
                   sudo: true

    system_command "/bin/ln",
                   args: ["-nsf", "--", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Home/lib/server/libjvm.dylib", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Home/bundle/Libraries/libserver.dylib"],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: ["-c", "Set :CFBundleGetInfoString AdoptOpenJDK #{version.before_comma}+#{version.after_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: ["-c", "Set :CFBundleIdentifier net.adoptopenjdk.#{version.before_comma}.jdk", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: ["-c", "Set :CFBundleName AdoptOpenJDK #{version.before_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: ["-c", "Set :JavaVM:JVMPlatformVersion #{version.before_comma}.#{version.after_comma}", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: ["-c", "Set :JavaVM:JVMVendor AdoptOpenJDK", "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk/Contents/Info.plist"],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/adoptopenjdk-#{version.before_comma}.jdk"
end
