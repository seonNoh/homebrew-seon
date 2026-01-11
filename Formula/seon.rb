class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "2024536c6a82b14b3294a399aab69bf7d70e8bc4fa4b2a178b5f46729d8c2c50"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "40faa50a3c15dfbdccd206b0b477b17a3deaf622ac07ba829dcf831a7c54b807"
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
