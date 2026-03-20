class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/378066770",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "8846b0ebe44f215bdd39414998e5e32f52a087f58cbc8ec20b50f9e17be6ac6c"
    else
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/378066794",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "05eb5e8f83ce9afc9b6f8970450a6f0d1aaecb32da9de183f7b4532070ead898"
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
