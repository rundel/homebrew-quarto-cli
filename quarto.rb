class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.624/quarto-0.9.624-macos.tar.gz"
  sha256 "87d0256832152a6dad9ab2a5d3f39fa8ed0e51b64d85be534b99aa1a8dbd2329"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
