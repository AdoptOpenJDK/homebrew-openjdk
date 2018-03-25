# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk8 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 8 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk8-releases/releases/download/jdk8u144-b01/OpenJDK8_x64_Mac_jdk8u144-b01.tar.gz"
  version "jdk8u144-b01"
  sha256 "dc0ae0cd1d87fa7b05cc7b4e3dcedcbb7f8f268118cdffb6d037dbd22ea82f13"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk8"].libexec/"bin"
  end

  test do
    system libexec/"bin/java", "-version"
  end
end
