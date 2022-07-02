class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.637/quarto-0.9.637-macos.tar.gz"
  sha256 "c3fa8f32539e8ef5de898c692ed2432ff07f6fa83226524b7fcd02bba4ab80d2"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
