class Musikcube < Formula
  homepage "https://musikcube.com"
  url "https://github.com/clangen/musikcube/archive/0.51.0.tar.gz"
  sha256 "15d01528283ab20a537fe9339a3d46fae1487172a4e1220dbe9ff3a14ae87631"
  head "git://github.com/clangen/musikcube.git"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "faad2"
  depends_on "flac"
  depends_on "lame"
  depends_on "libev"
  depends_on "libmicrohttpd"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "openssl"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
