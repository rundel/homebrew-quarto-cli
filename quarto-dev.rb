class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.62/quarto-1.2.62-macos.tar.gz"
  sha256 "9b3cbeb0e842ac8183446e3cf690e826dc5cd7f69ca117004e94f5258223af8e"
  license "GPL-2.0-or-later"

  conflicts_with "quarto"

  def install
    if Hardware::CPU.arm?
      cd "bin/tools"
      ln_s "deno-aarch64-apple-darwin/deno", "deno", 
      cd "../../"
    end

    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end
