# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk11-openj9-large" do
  version "11.0.8,10"
  sha256 "54f087c5ac4463126170278823c84764274c2e5b5e8edc1a4d8e402911025027"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.8%2B10_openj9-0.21.0/OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.8_10_openj9-0.21.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 11 (OpenJ9) (XL)"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK11U-jdk_x64_mac_openj9_macosXL_11.0.8_10_openj9-0.21.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.11-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.11-openj9.jdk"
end
