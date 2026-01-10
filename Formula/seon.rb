class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.0.1/seon-darwin-arm64"
      sha256 "5fe9bc09c70da3b4994d731e1b3ffaa52dd907938fe067287e25cadbddbcc8f1"
    else
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.0.1/seon-darwin-amd64"
      sha256 "9662c15ddd7447887bae0cb5bbe31500decf31aca863d2a7aeefda0bf9c999b0"
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
