class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.32/quarto-1.0.32-macos.tar.gz"
  sha256 "545f5d9a1e4ac1867933b8e0a40119689d122060780217ca1e5bc724a3172ff3"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
