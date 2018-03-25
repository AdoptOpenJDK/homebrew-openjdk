# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk9 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 9 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk9-releases/releases/download/jdk-9%2B181/OpenJDK9_x64_Mac_jdk-9.181.tar.gz"
  version "jdk-9+181"
  sha256 "294fcddca3c0b4b1f4969030b7754fce284155b9d6d1cd233b2f928d44322c07"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk9"].libexec/"bin"
  end

  test do
    system libexec/"bin/java", "-version"
  end
end
