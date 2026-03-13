# Pre-built binaries from GitHub Releases. No Deno or compile on install.
# The Release workflow's update-tap job sets version and the 4 platform SHAs.
class GitHappens < Formula
  desc "AI-powered PR reviews from the CLI"
  homepage "https://github.com/samvaran/git-happens"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-arm64-macos"
      sha256 "9b50c0ec78a1eeb9b08648e11d730180976d678e594997c1be8cfa015b988945"
    end
    on_intel do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-x64-macos"
      sha256 "101b80dff2352c7bde0a7d59442a01bfdb899f3cbc3446a5285740dc3243c9db"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-arm64-linux"
      sha256 "643f93d24b0f5c7f41e6d69ef2784baa7a64c965733a4084e1db216a923fb7e9"
    end
    on_intel do
      url "https://github.com/samvaran/git-happens/releases/download/v#{version}/git-happens-#{version}-x64-linux"
      sha256 "bcc06a256abc68ebc08d115c26f6a1907b6a79b4bf7994b2c41b39c51cd4eea4"
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
