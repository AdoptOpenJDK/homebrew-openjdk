# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk10 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 10 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk10-releases/releases/download/jdk-10.0.2+13/OpenJDK10_x64_Mac_jdk-10.0.2.13.tar.gz"
  version "jdk-10.0.2+13"
  sha256 "5fe24ab7845005c94bddf5f28bd876b63a2a316f7ab757a5d1eddc24e229b7ae"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk10"].libexec/"bin"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
