cask "adoptopenjdk12-openj9-jre" do
  version "12.0.2,10"
  sha256 "f31d3152f585f761b69529f87b23078639105534d7ea019340f24c199f082f2f"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10.2_openj9-0.15.1/OpenJDK12U-jre_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg"
  livecheck "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 12 (OpenJ9 JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK12U-jre_x64_mac_openj9_12.0.2_10_openj9-0.15.1.pkg"

  uninstall pkgutil: "net.adoptopenjdk.#{version.major}-openj9.jre"
end
