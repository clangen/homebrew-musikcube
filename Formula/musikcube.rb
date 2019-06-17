require 'formula'

class Musikcube < Formula
    homepage 'http://musikcube.com'
    head 'git://github.com/clangen/musikcube.git'
    url 'https://github.com/clangen/musikcube/archive/0.65.1.tar.gz'
    sha256 'e847bd71d3852e83a50b6b0a796e88386f61f09f3fb6379c866616edba4c8b72'
    version '0.65.1'

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

    def install
        system "cmake -DCMAKE_BUILD_TYPE=Release -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX} -DCMAKE_INSTALL_PREFIX=#{prefix} ."
        system "make"
        system "cmake ."
        system "make install"
    end
end
