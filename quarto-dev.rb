class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.66/quarto-1.2.66-macos.tar.gz"
  sha256 "eb0da0cea1fde00e0f36c0d1d847633c63a84837b072686f1369655ebcb3e18c"
  license "GPL-2.0-or-later"

  conflicts_with "quarto"

  def install
    if Hardware::CPU.arm?
      cd "bin/tools" do
        ln_s "deno-aarch64-apple-darwin/deno", "deno", force: true
      end
    end

    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
