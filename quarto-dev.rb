class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.8/quarto-1.3.8-macos.tar.gz"
  sha256 "113cb9bd0763babc19ec7054e87ebfb0efe1b5fce5c5c7a1a98046d1f0b8b8d6"
  license "GPL-2.0-or-later"

  conflicts_with "quarto"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
