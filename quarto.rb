class Quarto < Formula
  desc "Scientific and technical publishing system built on Pandoc"
  homepage "https://www.quarto.org/"
  url "https://github.com/quarto-dev/quarto-cli/releases/download/v1.11.9/quarto-1.11.9-macos.tar.gz"
  sha256 "9fc24881f637612d80edbf16d62f01001fc7945a9a0c6ac247199002901e0a6d"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  conflicts_with "quarto-dev"

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
  # Stash pristine copies in a tarball, which the relocation pass ignores since
  # it only walks Mach-O files, and restore them in post_install_steps, which
  # run after relocation. The tarball is kept so `brew postinstall quarto`
  # repairs the install again if anything else re-signs the libraries.
  def install
    prefix.install Dir["*"]

    cd prefix do
      system "tar", "-czf", "signed-libs.tar.gz", *Dir["bin/tools/**/*.{dylib,snapshot}"]
    end
  end

  post_install_steps do
    run "/usr/bin/tar", args: ["-xzf", "{{prefix}}/signed-libs.tar.gz", "-C", "{{prefix}}"]
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
