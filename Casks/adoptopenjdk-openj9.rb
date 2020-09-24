# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk-openj9" do
  version "15,36"
  sha256 "f62aa818f0a4a12942d5405e10b26d281a5a6791cbace67f5d7472ad9053b7e5"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk15-binaries/releases/download/jdk-15%2B36_openj9-0.22.0/OpenJDK15U-jdk_x64_mac_openj9_15_36_openj9-0.22.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jdk_x64_mac_openj9_15_36_openj9-0.22.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jdk"
end
