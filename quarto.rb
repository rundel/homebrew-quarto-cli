class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-macos.tar.gz"
  sha256 "c3da6a26bd58f07e18aaa77e621573286b4a127b73e023f89ea79567a30aa05c"
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
    system "#{bin}/quarto", "--version"
    system "#{bin}/quarto", "check", "install"
  end
end
