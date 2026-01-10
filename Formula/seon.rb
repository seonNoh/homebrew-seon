class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonology-cli/releases/download/v0.1.0/seon-darwin-arm64"
      sha256 "d891e9df2f9e5810e33eb798bb57fc291962eba1d55a791e1e758276474c63d2"
    else
      url "https://github.com/seonNoh/seonology-cli/releases/download/v0.1.0/seon-darwin-amd64"
      sha256 "82b224b49265cae692696099d82241ce7f303710694483548ee0b51e8a94231d"
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
