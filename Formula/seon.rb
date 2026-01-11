class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "87ad23e85a32c6f99b6e00a94bca64955bac8afbd6c7640e85821532fbadc97c"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "ea4f0fec50c6a1929bdc949f3d85bb4577de9aa6b355a5358865086386b73fc8"
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
