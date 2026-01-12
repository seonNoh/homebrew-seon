class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "2d3e4013f48ed3f2822479572bb7140c681fee553ec4a9ca6db441f9812e98f7"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "3fd659e4a2eaac499f9009aadae6b66eef2485948146ce5426149e8876eab99a"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "seon-darwin-arm64" => "seon"
    else
      bin.install "seon-darwin-amd64" => "seon"
    end
  end

  test do
    system "#{bin}/seon", "--version"
  end
end
