class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.258/quarto-1.2.258-macos.tar.gz"
  sha256 "9c2dc1fbd05e1ed3ebf703488363fb8184d2baecb656c1f1b1cfc433b202f5ff"
  license "GPL-2.0-or-later"

  conflicts_with "quarto"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
