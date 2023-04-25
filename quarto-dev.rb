class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.6/quarto-1.4.6-macos.tar.gz"
  sha256 "cc8a1e913a10985e8d33f1a129c66197f9d9c91ffb4fc4ed9388586a400439a7"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  conflicts_with "quarto"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "#{bin}/quarto", "--version"
    system "#{bin}/quarto", "check", "install"
  end
end
