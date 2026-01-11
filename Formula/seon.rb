class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "bebdae58fb407548cbe28a5d25be70ee4129e0f3f1e957bbf2e87383d65bab72"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "9a55e7161674409ac48b0694e13a51d4be61c2fc5a97845c71b1533fa145c826"
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
