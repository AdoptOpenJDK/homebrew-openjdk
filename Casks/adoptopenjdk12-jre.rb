cask "adoptopenjdk12-jre" do
  version "12.0.2,10"
  sha256 "f673cfc7673ce9b3704e9bb2149b49529968ce2d8247ec745c4d49abf147bbd4"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10.2/OpenJDK12U-jre_x64_mac_hotspot_12.0.2_10.pkg"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 12 (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK12U-jre_x64_mac_hotspot_12.0.2_10.pkg"

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}.jre"
end
