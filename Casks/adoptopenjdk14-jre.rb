# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk14-jre" do
  version "14.0.2,12"
  sha256 "6e645faff5a7d2aa748b16a1af0e904a5ff2ee9fb1849bfffe132ee56a6b7567"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14.0.2%2B12/OpenJDK14U-jre_x64_mac_hotspot_14.0.2_12.pkg"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 14 (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK14U-jre_x64_mac_hotspot_14.0.2_12.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.14.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.14.jre"
end
