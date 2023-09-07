cask "adoptopenjdk12" do
  version "12.0.2,10"
  sha256 "146c83e02e3ea058f93470c8e3b32bfa01e288175723e615c60a993e98b159fc"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10.2/OpenJDK12U-jdk_x64_mac_hotspot_12.0.2_10.pkg"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 12"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK12U-jdk_x64_mac_hotspot_12.0.2_10.pkg"

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jdk"
end
