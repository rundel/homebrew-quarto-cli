class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.203/quarto-1.2.203-macos.tar.gz"
  sha256 "6191c3ad7c758c27f72d18348c182e0d5d28672cb3f284dc297edb7c1b91dd69"
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
