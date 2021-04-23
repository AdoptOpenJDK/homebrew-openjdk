# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk16-openj9" do
  version "16,36"
  sha256 "02d7df5e7ff7ee6d90c1d9cc2f30219f88f59a226301706a4e8657dfb55cbfc7"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-16%2B36_openj9-0.25.0/OpenJDK16-jdk_x64_mac_openj9_16_36_openj9-0.25.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 16 (OpenJ9)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK16-jdk_x64_mac_openj9_16_36_openj9-0.25.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.16-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.16-openj9.jdk"
end