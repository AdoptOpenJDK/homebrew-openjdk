# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk-openj9-jre" do
  version "15.0.1,9.1"
  sha256 "1f6c33aa0ffa9e381c8017589fda80962fc43623233da351bccbee47edc960f3"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk15-binaries/releases/download/jdk-15.0.1%2B9.2_openj9-0.23.0/OpenJDK15U-jre_x64_mac_openj9_15.0.1_9_openj9-0.23.0.pkg"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9) (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jre_x64_mac_openj9_15.0.1_9_openj9-0.23.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jre"
end
