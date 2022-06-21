class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  version "0.9.598"  
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v#{version}/quarto-#{version}-macos.tar.gz"
  sha256 "79a3ef678c251118e54e711fc253c1db16c99ea10f7416b1f7985903d9922efa"
  license "GPL-2.0-or-later"

  def install
    prefix.install Dir["*"]
  end

  test do
    system "quarto", "--version"
    system "quarto", "check", "install"
  end
end