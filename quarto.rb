class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.607/quarto-0.9.607-macos.tar.gz"
  sha256 "d8027cbf934806b7aa48ac060212386268805e6aa579c847e483eabde15ea7bf"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
