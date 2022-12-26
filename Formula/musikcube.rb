require 'formula'
require 'hardware'

$VERSION = '0.99.1'

class Musikcube < Formula
    homepage 'http://musikcube.com'
    head 'git://github.com/clangen/musikcube.git'
    url "https://github.com/clangen/musikcube/archive/#{$VERSION}.tar.gz"
    sha256 'c02c2a7c255929a8d315fe5d586413db2555be4d7fa482336c193011a197cce1'
    version "#{$VERSION}"

    depends_on 'cmake' => :build
    depends_on 'ccache' => :build
    depends_on 'git' => :build
    depends_on 'libogg'
    depends_on 'libvorbis'
    depends_on 'ffmpeg'
    depends_on 'libmicrohttpd'
    depends_on 'lame'
    depends_on 'libev'
    depends_on 'openssl'
    depends_on 'gnutls'
    depends_on 'taglib'
    depends_on 'curl'
    depends_on 'libopenmpt'
    depends_on 'libgme'
    depends_on 'taglib'
    depends_on 'ncurses'

    def install
        job_count = [Hardware::CPU.cores - 2, 1].max
        system "git clone --branch asio-1-24-0 https://github.com/chriskohlhoff/asio/ src/3rdparty/asio/"
        system "cmake -DCMAKE_BUILD_TYPE=Release -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX} -DCMAKE_INSTALL_PREFIX=#{prefix} ."
        system "make -j#{job_count}"
        system "cmake ."
        system "make install"
        system "install_name_tool -add_rpath \"@executable_path/\" #{HOMEBREW_PREFIX}/Cellar/musikcube/#{$VERSION}/share/musikcube/musikcube 2> /dev/null || true"
        system "install_name_tool -add_rpath \"@executable_path/\" #{HOMEBREW_PREFIX}/Cellar/musikcube/#{$VERSION}/share/musikcube/musikcubed 2> /dev/null || true"
    end
end
