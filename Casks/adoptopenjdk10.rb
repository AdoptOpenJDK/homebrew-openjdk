cask "adoptopenjdk10" do
  version "10,0.2:13"
  sha256 "550fac840563073dcfaa1ffd4a3a9cc68fd8ccc71bbc65baf3cb32ec734c30dd"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-10.0.2%2B13.1/OpenJDK10U-jdk_x64_mac_hotspot_10.0.2_13.tar.gz", verified: "https://github.com/AdoptOpenJDK"
  livecheck "https://github.com/AdoptOpenJDK/openjdk10-binaries/releases/latest"
  name "AdoptOpenJDK 10"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  postflight do
    system_command "/bin/mv",
                   args: [
                     "-f",
                     "--",
                     "#{staged_path}/jdk-10.0.2+13",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk",
                   ],
                   sudo: true

    system_command "/bin/mkdir",
                   args: [
                     "-p",
                     "--",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Home/bundle/Libraries",
                   ],
                   sudo: true

    system_command "/bin/ln",
                   args: [
                     "-nsf",
                     "--",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Home/lib/server/libjvm.dylib",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/" \
                     "Contents/Home/bundle/Libraries/libserver.dylib",
                   ],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: [
                     "-c",
                     "Set :CFBundleGetInfoString AdoptOpenJDK 10+0.2:13",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Info.plist",
                   ],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: [
                     "-c",
                     "Set :CFBundleIdentifier net.adoptopenjdk.10.jdk",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Info.plist",
                   ],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: [
                     "-c",
                     "Set :CFBundleName AdoptOpenJDK 10",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Info.plist",
                   ],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: [
                     "-c",
                     "Set :JavaVM:JVMPlatformVersion 10.0.2:13",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Info.plist",
                   ],
                   sudo: true

    system_command "/usr/libexec/PlistBuddy",
                   args: [
                     "-c",
                     "Set :JavaVM:JVMVendor AdoptOpenJDK",
                     "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk/Contents/Info.plist",
                   ],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/adoptopenjdk-10.jdk"
end
