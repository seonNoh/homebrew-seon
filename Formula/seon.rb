class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "2e97f2d3426f0bae0e0992d7bb6dc156b72a109542039d0442b0a2905505cd38"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "d34b7395004206f95b0de621f5260e5bb47450cfe0b0db471ce7e0242bc5870c"
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
