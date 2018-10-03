# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk11 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 11 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11%2B28/OpenJDK11-jre_x64_mac_hotspot_11_28.tar.gz"
  version "jdk-11.28"
  sha256 "a7ef3669e22497e01fc47b28d7c66de42f0fee52b23302b75649dee239108812"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk11"].libexec/"bin"
    opoo "These binaries are not JCK compliant and should not be used in production"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
