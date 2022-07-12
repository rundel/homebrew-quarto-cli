class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.12/quarto-1.0.12-macos.tar.gz"
  sha256 "708d45fecad4f9a0c3940f6b9ed61283a4b5fcff17b56cd6be05a374e36bbf06"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
