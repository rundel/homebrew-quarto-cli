class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.629/quarto-0.9.629-macos.tar.gz"
  sha256 "7974fa3936fedd7b6ed7f3353b83dbcca1dae450b5e80b9c30050dc9babb38ab"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
