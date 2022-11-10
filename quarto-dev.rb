class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.269/quarto-1.2.269-macos.tar.gz"
  sha256 "4bf7f46ac2249ef8e78c33c988f792fe4c342599edf933c08d7cc722ea7c824d"
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
