class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.0.16/quarto-1.0.16-macos.tar.gz"
  sha256 "28157aa1a3d7b19a9c883d9e459670b93934ef4dd6f55f8c98154f7ecf23d00f"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
