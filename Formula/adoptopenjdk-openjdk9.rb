# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk9 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 9 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk9-binaries/releases/download/jdk-9.0.4%2B11/OpenJDK9U_x64_mac_hotspot_2018-08-08-15-47.tar.gz"
  version "jdk-9.0.4+11"
  sha256 "81e393f31cdf71077e433dc94d46c5782be7d0299d20c58abbbb29766bb04dd5"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk9"].libexec/"bin"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
