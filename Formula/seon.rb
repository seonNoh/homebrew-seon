class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://cli.seonology.com"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.seonology.com/releases/seon-darwin-arm64"
      sha256 "873b7fffa295ebbfed2658aa6ebb75845cd919fa5a8eefc73ff7ee7819cf12ef"
    else
      url "https://cli.seonology.com/releases/seon-darwin-amd64"
      sha256 "1e61d359eb12679f59bae7b9aa8392197b891caf976766bfd01e6548850b0b03"
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
