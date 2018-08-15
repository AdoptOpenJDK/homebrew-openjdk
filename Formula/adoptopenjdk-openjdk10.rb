# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk10 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 10 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk10-releases/releases/download/jdk-10.0.1+10/OpenJDK10_x64_Mac_201807101745.tar.gz"
  version "jdk-10.0.1+10"
  sha256 "a4d9ce9d19961d95f4def0a9d1c7fd5cbd3c83a9d6f7f3c1b37f618bf1cf58c0"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk10"].libexec/"bin"
    opoo "These binaries are not JCK compliant and should not be used in production"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
