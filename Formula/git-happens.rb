# Copy this file to your Homebrew tap as Formula/git-happens.rb.
# Replace YOUR_GITHUB_ORG and YOUR_REPO with your GitHub org/user and repo (e.g. myuser/git-happens).
# The release-tap workflow updates only "version" and "sha256" when you publish a release.

class GitHappens < Formula
    desc "AI-powered PR reviews from the CLI"
    homepage "https://github.com/samvaran/git-happens"
    version "0.0.1"
    url "https://github.com/samvaran/git-happens/archive/refs/tags/v#{version}.tar.gz"
    sha256 "dfe210e2e2b5b83925cd67893ed02f10354693a93f9c5061cb268961ff53b307"
    license "MIT"
  
    depends_on "deno"
  
    def install
      system "deno", "task", "compile"
      bin.install "git-happens"
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/git-happens --version").strip
    end
  end
  