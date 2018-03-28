# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdoptopenjdkOpenjdk10 < Formula
  desc "AdoptOpenJDK main binary releases for OpenJDK 10 with HotSpot"
  homepage "https://adoptopenjdk.net/"
  url "https://github.com/AdoptOpenJDK/openjdk10-releases/releases/download/jdk-10%2B23/OpenJDK10_x64_Mac_jdk-10.23.tar.gz"
  version "jdk-10+23"
  sha256 "918b01c1fd7108064c6d45ed3fbea51396ca8b13bdc675bc550e4a53d70dd391"

  def install
    prefix.install Dir["*"]
    ENV.prepend_path "PATH", Formula["adoptopenjdk-openjdk10"].libexec/"bin"
    opoo "These binaries are not JCK compliant and should not be used in production"
  end

  test do
    system prefix/"bin/java", "-version"
  end
end
