class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.3/quarto-1.0.3-macos.tar.gz"
  sha256 "9340ba8ef3ce22dd662cd4b65403be2b7c17713a47112a547ea4a804a7a33c9a"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
