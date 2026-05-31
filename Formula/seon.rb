class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "1.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434452492",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "a0dd13de68e631d04a13375590022783895d52dba2c8d537bece334784a3c713"
    else
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434452508",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "91a1e2f9bafe962edae35e2f9b35f7883c66cf31ea4dccf37fd681687882d746"
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
