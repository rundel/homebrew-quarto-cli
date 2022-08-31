class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.1.165/quarto-1.1.165-macos.tar.gz"
  sha256 "445f8a33c5b3ea35a55663bebe8f2057d8b7d27002efb5fc8f2baeee5a95f992"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  conflicts_with "quarto-dev"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
