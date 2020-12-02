# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk-openj9-jre-large" do
  version "15.0.1,9.1"
  sha256 "2f4e909692eba27847240e63ed4735605b38c669822dff4bb9120ab0e64c978b"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk15-binaries/releases/download/jdk-15.0.1%2B9.2_openj9-0.23.0/OpenJDK15U-jre_x64_mac_openj9_macosXL_15.0.1_9_openj9-0.23.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jre_x64_mac_openj9_macosXL_15.0.1_9_openj9-0.23.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jre"
end
