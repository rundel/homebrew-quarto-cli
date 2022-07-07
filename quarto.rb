class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.649/quarto-0.9.649-macos.tar.gz"
  sha256 "1ae4bc43062c80c61f2e5a3df8c28590a6a57d8bb57967697bb3153f54a09f92"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
