# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk11-openj9-jre-large" do
  version "11.0.9,11"
  sha256 "f62dabbf45080d0a00d69a1c4fc65fc090fa900721fb9055dda928667716d4ca"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.9%2B11.2_openj9-0.23.0/OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.9_11_openj9-0.23.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 11 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK11U-jre_x64_mac_openj9_macosXL_11.0.9_11_openj9-0.23.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.11-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.11-openj9.jre"
end
