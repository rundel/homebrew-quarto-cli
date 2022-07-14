class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.23/quarto-1.0.23-macos.tar.gz"
  sha256 "b0326e74e5ce4c07c4969183a1efd570d6125d307b840d52767df60803fd14fd"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
