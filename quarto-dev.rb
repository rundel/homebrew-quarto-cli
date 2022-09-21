class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.142/quarto-1.2.142-macos.tar.gz"
  sha256 "d4bc77599659eca8b9771c5124a3043c071a27fc6ecdbdead1742d27f7945b75"
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
