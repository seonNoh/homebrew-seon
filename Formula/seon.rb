class Seon < Formula
  desc "Seonology infrastructure management CLI"
  homepage "https://github.com/seonNoh/seonology-k8s-seonology-cli"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434408254",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "b72a7c939b66291d1c6d83fc9f67ffb7ce0c496502ba35cba237a168e1b17e1b"
    else
      url "https://api.github.com/repos/seonNoh/seonology-k8s-seonology-cli/releases/assets/434408266",
        using: :nounzip,
        headers: ["Authorization: token #{ENV["HOMEBREW_GITHUB_API_TOKEN"]}",
                  "Accept: application/octet-stream"]
      sha256 "c5bef8954c950dd6a5b51fd440bb8fbb7e11da3d03354a5bcd7fccc54e3aaf85"
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
