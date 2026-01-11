class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.0.2/seon-darwin-arm64"
      sha256 "b9df21a9474de2bf3a4b142976091fdac7681a8db9f9e862aab555809ce43db1"
    else
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.0.2/seon-darwin-amd64"
      sha256 "f9e6070c12a9bd1ea8cddccee00d7a5c1375ecba091f47cf602f7db75687b3ad"
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
