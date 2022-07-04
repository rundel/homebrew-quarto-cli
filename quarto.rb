class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.640/quarto-0.9.640-macos.tar.gz"
  sha256 "9ba66f4617c8e5afb6400e9e09e36c4c2c7977c096da4f6536672ed3103a075a"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
