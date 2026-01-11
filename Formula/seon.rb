class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.1.0/seon-darwin-arm64"
      sha256 "c5c17cb316b63ec1a3ecf009af5811e846f80ba2031fd599c6f04f591b0898a6"
    else
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.1.0/seon-darwin-amd64"
      sha256 "e934ff9d89fb8840ab7a740ba266760ff39d72dcab1af955859bf3e84c93f2d2"
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
