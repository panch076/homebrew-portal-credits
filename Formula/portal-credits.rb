class PortalCredits < Formula
  desc "Portal (2007) end credits, recreated in your terminal"
  homepage "https://github.com/panch076/portal-credits"
  url "https://github.com/panch076/portal-credits/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e77efeaa29a71ce058f2140d3d7f3509879a29a10c8f50aa424f3a0f12c29d13"
  # The code is MIT. The bundled credit text and ASCII art are Valve's, and the
  # song is deliberately not included, so the package as a whole is not MIT.
  license :cannot_represent
  head "https://github.com/panch076/portal-credits.git", branch: "main"

  depends_on "node"

  def install
    libexec.install "bin/portal-credits.js", "bin/portal-data.js"
    bin.write_exec_script libexec/"portal-credits.js"

    # A place for the user's own copy of the song; the CLI looks here.
    (share/"portal-credits").mkpath
    (share/"portal-credits/README.txt").write <<~TXT
      Put your own copy of "Still Alive" in this folder, named still-alive.mp3
      (or portal_still_alive.mp3, .flac, .m4a, .ogg, .wav) and portal-credits
      will find it automatically.

      The song is not distributed with this package. Get it from the free
      Portal Soundtrack DLC on Steam, or extract
      sound/music/portal_still_alive.mp3 out of
      steamapps/common/Portal/portal/portal_pak_dir.vpk with GCFScape,
      VPKEdit or Source2Viewer-CLI.
    TXT
  end

  def caveats
    <<~EOS
      The song is not included. Copy your own copy of "Still Alive" to:
        #{opt_share}/portal-credits/still-alive.mp3

      Sound plays through ffplay, mpv, vlc or sox, or macOS afplay.
      Install one if you have none, e.g.:
        brew install ffmpeg
    EOS
  end

  test do
    assert_match "Forms FORM-29827281-12",
                 shell_output("#{bin}/portal-credits --frame 3 --width 80 --height 30 --no-color")
  end
end
