# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-openj9-jre" do
  version "8,292:b10"
  sha256 "567e3a5062070f1218c3f4e0275d5287aface76190dcce8419240a1cbcac6f9d"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.before_comma}-binaries/releases/download/jdk8u292-b10_openj9-0.26.0/OpenJDK8U-jre_x64_mac_openj9_8u292b10_openj9-0.26.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8 (OpenJ9) (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jre_x64_mac_openj9_8u292b10_openj9-0.26.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8-openj9.jre"
end
