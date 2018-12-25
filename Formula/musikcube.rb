require 'formula'

class Musikcube < Formula
    homepage 'http://musikcube.com'
    head 'git://github.com/clangen/musikcube.git'
    url 'https://github.com/clangen/musikcube/archive/0.51.0.tar.gz'
    sha256 '15d01528283ab20a537fe9339a3d46fae1487172a4e1220dbe9ff3a14ae87631'
    version '0.51.0'

    depends_on 'cmake' => :build
    depends_on 'boost'
    depends_on 'libogg'
    depends_on 'libvorbis'
    depends_on 'flac'
    depends_on 'faad2'
    depends_on 'libmicrohttpd'
    depends_on 'lame'
    depends_on 'libev'
    depends_on 'openssl'
    depends_on 'taglib'

    def install
        system "cmake -DCMAKE_BUILD_TYPE=Release -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX} -DCMAKE_INSTALL_PREFIX=#{prefix} ."
        system "make"
        system "cmake ."
        system "make install"
    end
end
