class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.340/quarto-1.3.340-macos.tar.gz"
  sha256 "3ca85109d6b4a5eecdc4a1b84421bde509b7a5cb39c55b3e8ef4cb9b26b78a4c"
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
