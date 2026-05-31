class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "1.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434428547",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "687fd69b984ce80e3532b4cec4cdf686064f7277735391da09b1e5fb21880ce7"
    else
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434428563",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "dac06244d1599b37ec984b98aeacd35bcc0323e090e7c3394422c43f9e922b6e"
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
