# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk11-openj9-jre-large" do
  version "11.0.8,10"
  sha256 "776692444c4de5b4c23a0bf8e96e588e48471f74ae3cdb8b311bed490537100f"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.8%2B10_openj9-0.21.0/OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.8_10_openj9-0.21.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 11 (OpenJ9) (JRE) (XL)"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.8_10_openj9-0.21.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.11-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.11-openj9.jre"
end
