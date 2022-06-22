class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.612/quarto-0.9.612-macos.tar.gz"
  sha256 "189eaaf6a192740bdd01445d960701143a79bcdd81192e7a1c35409bf012c396"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
