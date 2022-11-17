class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.11/quarto-1.3.11-macos.tar.gz"
  sha256 "2846bda8df9af1ad27e45b7a69e8b22fe787753efe568730cb974261a0c01ea4"
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
