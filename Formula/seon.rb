class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.1.0/seon-darwin-arm64"
      sha256 "cdc572d6ffd6d5cca4dc2ec2a78423920a00b62693898e4fb8fc6c5ae7a446bd"
    else
      url "https://github.com/seonNoh/seonolgy-k8s-seonology-cli/releases/download/v0.1.0/seon-darwin-amd64"
      sha256 "432b760b50febadc93597644910cae18653a6a6b57b595568b90abfe11f6c05e"
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
