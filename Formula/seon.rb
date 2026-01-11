class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "dbcf53fcb5fa2edf8f5ff8e0034f038becd66a729574306728b666ffb40cd649"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "3eab11bbd541c31bac9306528ea9a8b0efeba7f5ff71f6972cb97f1e85d26222"
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
