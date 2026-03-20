class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "7b60655d5cb4211075a82e5560c4b28ccca390e83b14f57d0677d6ff1dc36d6e"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "65672fcb0f830c588dc5c8f6ff9b1a1fd23deb3403af4a9a5fb1868e5b8c9035"
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
