class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.600/quarto-0.9.600-macos.tar.gz"
  sha256 "1fdafb7314aa0e852ead7fe92e7b5d1edffafd5d6e2b860f7fd08a9504ef5b5e"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
