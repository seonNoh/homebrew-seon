class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seonNoh/seonology-k8s-seonology-cli/releases/download/v1.0.0/seon-darwin-arm64",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "9094797069aa0d2e799a001091d69d006cfeb8f0c09f28527dc114e05a35c5e5"
    else
      url "https://github.com/seonNoh/seonology-k8s-seonology-cli/releases/download/v1.0.0/seon-darwin-amd64",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "b35e7e83984875cce1f6003c9dee6bd2a4a7bc3308284a72a16a64d13c227a19"
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
