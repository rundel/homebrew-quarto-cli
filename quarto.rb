class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.619/quarto-0.9.619-macos.tar.gz"
  sha256 "15dad6a6d0e1e4dfb623ff5c10d9ca43fc472af4a4401212cff05780acf260f4"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
