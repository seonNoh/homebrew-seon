class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "0.0.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonology-k8s-seonology-cli/releases/download/v0.0.15/seon-darwin-arm64"
      sha256 ""
    else
      url "https://github.com/seonNoh/seonology-k8s-seonology-cli/releases/download/v0.0.15/seon-darwin-amd64"
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
