require 'formula'

$VERSION = '0.99.0'

class Musikcube < Formula
    homepage 'http://musikcube.com'
    head 'git://github.com/clangen/musikcube.git'
    url "https://github.com/clangen/musikcube/archive/#{$VERSION}.tar.gz"
    sha256 '2d4295a272e816c6fd10c95aefb4210ec407dcfdfaeef77089842f67c968969c'
    version "#{$VERSION}"

    depends_on 'cmake' => :build
    depends_on 'ccache' => :build
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
        system "cmake -DCMAKE_BUILD_TYPE=Release -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX} -DCMAKE_INSTALL_PREFIX=#{prefix} ."
        system "make"
        system "cmake ."
        system "make install"
        system "install_name_tool -add_rpath \"@executable_path/\" #{HOMEBREW_PREFIX}/Cellar/musikcube/#{$VERSION}/share/musikcube/musikcube || true"
        system "install_name_tool -add_rpath \"@executable_path/\" #{HOMEBREW_PREFIX}/Cellar/musikcube/#{$VERSION}/share/musikcube/musikcubed || true"
    end
end
