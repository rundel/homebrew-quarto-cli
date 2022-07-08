class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.655/quarto-0.9.655-macos.tar.gz"
  sha256 "a97add02e8e02d9c9aa904e5497653cb926caca00532a609503a27c12a70efc1"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
