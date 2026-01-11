class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "16d95dd71a478b08ccf1b5f97d718b72e8d61941cc72d025ed3648f1879c249f"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "9b27a8424620ddc771a6b09e61f1e1c1c7bb948ac325afa122cc28bd3e8400cf"
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
