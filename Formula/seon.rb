class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonology-k8s-seonology-cli/releases/download/v0.0.3/seon-darwin-arm64"
      sha256 "9b2d18b460c7bfde3ddfa2ead86c822daa7c3568df0f4f9ef2480af3934f3689"
    else
      url "https://github.com/seonNoh/seonology-k8s-seonology-cli/releases/download/v0.0.3/seon-darwin-amd64"
      sha256 "b6034dfafa5d7aa9efaf0e5e09cf07607ea31ec252e36cc8310112159bd0b2d6"
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
