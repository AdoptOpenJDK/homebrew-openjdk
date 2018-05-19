# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk8 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 8 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk8-releases/releases/download/jdk8u172-b11/OpenJDK8_x64_Mac_jdk8u172-b11.tar.gz"
  version "jdk8u172-b11"
  sha256 "228d85bef36f5893885b52cb571101418c4f8b87c689996ace55d85b720b2a12"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk8"].libexec/"bin"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
