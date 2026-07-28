class QuartoDev < Formula
  desc "Scientific and technical publishing system built on Pandoc (pre-release)"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.0/quarto-1.11.0-macos.tar.gz"
  sha256 "2011119460fc590c1ae0a33ab1f7a374e6f5c8c0a3362bcdca4e4c15eb1e45e3"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  conflicts_with "quarto"

  # Four bundled libraries carry an LC_ID_DYLIB: the dart-sass snapshots (whose
  # ID is the bare name "sass.native") and the deno_dom plugins (whose ID is an
  # absolute path into the upstream CI build directory). Homebrew's relocation
  # pass rewrites both kinds with install_name_tool and then ad-hoc re-signs the
  # files, which drops their Developer ID team identifier. The `dart` and `deno`
  # executables that load them run under the hardened runtime without
  # disable-library-validation, so afterwards dlopen is refused: SCSS renders
  # fail with "Loading dynamic library failed ... different Team IDs" and HTML
  # renders segfault in deno.
  #
  # Stash pristine copies as tarballs, which the relocation pass ignores since
  # it only walks Mach-O files, and restore them in post_install, which runs
  # after relocation. The tarballs are kept so `brew postinstall quarto-dev`
  # repairs the install again if anything else re-signs the libraries.
  def signed_libs
    Dir[prefix/"bin/tools/**/*.dylib"] + Dir[prefix/"bin/tools/**/*.snapshot"]
  end

  def install
    prefix.install Dir["*"]

    signed_libs.each do |lib|
      system "tar", "-czf", "#{lib}.pristine.tar.gz",
             "-C", File.dirname(lib), File.basename(lib)
    end
  end

  def post_install
    Dir[prefix/"bin/tools/**/*.pristine.tar.gz"].each do |stash|
      system "tar", "-xzf", stash, "-C", File.dirname(stash)
    end
  end

  test do
    system "#{bin}/quarto", "--version"
    system "#{bin}/quarto", "check", "install"

    # A render exercises both dart-sass and deno_dom, so it fails if either lost
    # its code signature to the relocation pass (see install).
    (testpath/"t.qmd").write "---\ntitle: t\n---\n\nhello\n"
    system "#{bin}/quarto", "render", testpath/"t.qmd", "--to", "html"
    assert_path_exists testpath/"t.html"
  end
end
