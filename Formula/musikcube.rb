require "hardware"

class Musikcube < Formula
  desc "Terminal-based audio engine, library, player and server"
  homepage "https://musikcube.com"
  url "https://github.com/clangen/musikcube/archive/0.99.2.tar.gz"
  sha256 "782ee8aba01b5e5cf4f5959570d087d7a1208a9309e5ae16074894801a8544bf"
  license "BSD-3-Clause"
  head "https://github.com/clangen/musikcube.git", branch: "master"

  depends_on "ccache" => :build
  depends_on "cmake" => :build
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
    @job_count = [Hardware::CPU.cores - 2, 1].max
    system "git",
              "clone",
              "--branch",
              "asio-1-24-0",
              "https://github.com/chriskohlhoff/asio/",
              "src/3rdparty/asio/"
    system "cmake",
              "-DCMAKE_BUILD_TYPE=Release",
              "-DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX}",
              "-DCMAKE_INSTALL_PREFIX=#{prefix}",
              "."
    system "make", "-j#{@job_count}"
    system "cmake", "."
    system "make", "install"
  end

  test do
    system "musikcubed", "--start"
    system "musikcubed", "--stop"
  end
end
