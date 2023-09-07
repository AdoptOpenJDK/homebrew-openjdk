cask "adoptopenjdk12-openj9" do
  version "12.0.2,10"
  sha256 "ba2282dd0f2a5d0098ee12c45f1c387ff73cbaa9cbdd9474c7354069b18f4163"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10.2_openj9-0.15.1/OpenJDK12U-jdk_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 12 (OpenJ9)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK12U-jdk_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg"

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jdk"
end
