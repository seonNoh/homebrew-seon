class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "544e33e6198f76e545233bcb0b69b1ad79384df49eec128e398ca5c5c1381a80"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "5bb0dc22f6b6584e68ca6cb4cbca989cf7a49ff0ba62465f3df1d03338a12026"
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
