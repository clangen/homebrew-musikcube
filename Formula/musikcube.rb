require 'formula'

$VERSION = '0.97.0'

class Musikcube < Formula
    homepage 'http://musikcube.com'
    head 'git://github.com/clangen/musikcube.git'
    url "https://github.com/clangen/musikcube/archive/#{$VERSION}.tar.gz"
    sha256 'ab170c5100251fcd6c8fd3c32eea45e9854c6c6272c6b0970bffbfc55d0b2ec5'
    version "#{$VERSION}"

    depends_on 'cmake' => :build
    depends_on 'boost'
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
    depends_on 'ncurses'

    def install
        system "cmake -DCMAKE_BUILD_TYPE=Release -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX} -DRPATH_PREFIX=#{HOMEBREW_PREFIX} -DCMAKE_INSTALL_PREFIX=#{prefix} ."
        system "make"
        system "cmake ."
        system "make install"
        system "install_name_tool -add_rpath \"@executable_path/\" #{HOMEBREW_PREFIX}/Cellar/musikcube/#{$VERSION}/share/musikcube/musikcube || true"
        system "install_name_tool -add_rpath \"@executable_path/\" #{HOMEBREW_PREFIX}/Cellar/musikcube/#{$VERSION}/share/musikcube/musikcubed || true"
    end
end
