# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk11 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 11 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk11-2018-09-27-00-34/OpenJDK11_x64_mac_hotspot_2018-09-27-00-34.tar.gz"
  version "jdk-11+28-201809261808"
  sha256 "7e17ab5ecbf690f9e34e2c421a9d012f179f9dacf757d00e5157de15cc3dc78f"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk11"].libexec/"bin"
    opoo "These binaries are not JCK compliant and should not be used in production"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
