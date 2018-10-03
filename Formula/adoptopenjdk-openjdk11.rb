# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk11 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 11 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11%2B28/OpenJDK11-jdk_x64_mac_hotspot_11_28.tar.gz"
  version "jdk-11.28"
  sha256 "809a797d72a78668095913cdb2b39d1cf03ab76d144fd9a660031e4f604165ab"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk11"].libexec/"bin"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
