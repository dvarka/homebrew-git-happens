# Pre-built binaries from GitHub Releases. No Deno or compile on install.
# The Release workflow's update-tap job sets version and the 4 platform SHAs.
class GitHappens < Formula
  desc "AI-powered PR reviews from the CLI"
  homepage "https://github.com/samvaran/git-happens"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-arm64-macos"
      sha256 "ARM64_MACOS_SHA"
    end
    on_intel do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-x64-macos"
      sha256 "X64_MACOS_SHA"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-arm64-linux"
      sha256 "ARM64_LINUX_SHA"
    end
    on_intel do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-x64-linux"
      sha256 "X64_LINUX_SHA"
    end
  end

  def install
    suffix = if OS.mac?
      Hardware::CPU.arm? ? "arm64-macos" : "x64-macos"
    else
      Hardware::CPU.arm? ? "arm64-linux" : "x64-linux"
    end
    bin.install "git-happens-#{version}-#{suffix}" => "git-happens"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-happens --version").strip
  end
end
