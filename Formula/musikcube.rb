class Musikcube < Formula
  desc "Terminal-based audio engine, library, player and server"
  homepage "https://musikcube.com"
  url "https://github.com/clangen/musikcube/archive/0.99.3.tar.gz"
  sha256 "584c8225caad46fde83cdd520ef7d4a6633471de9693651f46d520040e9fb51d"
  license "BSD-3-Clause"
  head "https://github.com/clangen/musikcube.git", branch: "master"

  depends_on "ccache" => :build
  depends_on "cmake" => :build
  depends_on "asio"
  depends_on "curl"
  depends_on "ffmpeg"
  depends_on "game-music-emu"
  depends_on "gnutls"
  depends_on "lame"
  depends_on "libev"
  depends_on "libmicrohttpd"
  depends_on "libogg"
  depends_on "libopenmpt"
  depends_on "libvorbis"
  depends_on "ncurses"
  depends_on "openssl@1.1"
  depends_on "taglib"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    # running `cmake .` again updates cached cmake variables to include resources
    # generated during the `make` phase; this ensures things like dynamic plugins,
    # locales, and themes are included in the install manifest.
    system "cmake", "."
    system "make", "install"
  end

  test do
    system "musikcubed", "--start"
    # if there is no lockfile then the daemon was unable to start properly
    system "head", "/tmp/musikcubed.lock"
    system "musikcubed", "--stop"
  end
end
