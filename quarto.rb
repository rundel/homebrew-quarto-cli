class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.554/quarto-1.4.554-macos.tar.gz"
  sha256 "6ca08413ed98fd6bc92458278b23e66764efffc3ae130b1646cb4a8028cd4161"
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
