# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk11 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 11 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://download.java.net/java/GA/jdk11/28/GPL/openjdk-11+28_osx-x64_bin.tar.gz"
  version "jdk-11+28"
  sha256 "6b969d2df6a9758d9458f5ba47939250e848dfba8b49e41c935cf210606b6d38"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk11"].libexec/"bin"
    opoo "These binaries are not JCK compliant and should not be used in production"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
