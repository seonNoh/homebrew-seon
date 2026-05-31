class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "1.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434435797",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "d670952ae192f39cfc87479c296568efdc1949e6f6ec8ba2e69630dd536767e2"
    else
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434435810",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "03716c30a3f9ea459f2101b7f96d4a93558a8656d023287f8568a82884092acd"
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
