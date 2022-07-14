class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.18/quarto-1.0.18-macos.tar.gz"
  sha256 "83f37407078b3f9a39c67f620f54bb09b6a24504463d78f2741cc6d565e63d8f"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
