class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 ""
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 ""
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
