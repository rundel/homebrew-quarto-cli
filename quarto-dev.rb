class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.274/quarto-1.4.274-macos.tar.gz"
  sha256 "54f74456afbc49d9eb207e9ad0e8a4eadfec8409a761d78e9a4adbb2795ad92f"
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
