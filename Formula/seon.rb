class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "152e789a7a1564a6dabc34ccf973d782f239e45ba08945f64b594663cca7ed5e"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "eea337afa71fb71965a09a20984eee8706d0861d0b87d79c688daa8d3db28f7e"
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
