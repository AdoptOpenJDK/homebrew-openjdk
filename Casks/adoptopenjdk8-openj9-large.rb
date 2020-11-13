# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-openj9-large" do
  version "8,275:b01"
  sha256 "9593e8aabe9b4e858d9250bc62687b329f367905f11cff972a734df44569ba0a"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u275-b01_openj9-0.23.0/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u275b01_openj9-0.23.0.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8 (OpenJ9) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u275b01_openj9-0.23.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8-openj9.jdk"
end
