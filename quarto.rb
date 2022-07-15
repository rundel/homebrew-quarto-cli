class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.28/quarto-1.0.28-macos.tar.gz"
  sha256 "65425aad4b83fea5e58b872c0c4451fabd4e55ef219a374a77796eae14069652"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
