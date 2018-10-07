# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk8 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 8 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk8-releases/releases/download/jdk8u172-b11/OpenJDK8_x64_Mac_jdk8u172-b11.tar.gz"
  version "jdk8u172-b11"
  sha256 "c271c5aeebfec5cd6f41c24092472a66fc55f893e3118e63f4c1ab1cb4446157"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk8"].libexec/"bin"
    opoo "Warning - This brew TAP is being DEPRECATED soon in favour of using brew cask. Please check out https://github.com/AdoptOpenJDK/homebrew-openjdk/blob/master/README.md for more info"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
