require 'formula'

class Musikcube < Formula
    homepage 'http://musikcube.com'
    head 'git://github.com/clangen/musikcube.git'
    url 'https://github.com/clangen/musikcube/archive/0.93.1.tar.gz'
    sha256 'e84e060acaab40266cc3d866f50f727c770c42273a5219fff5d6757186dbad21'
    version '0.93.1'

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

    def install
        system "cmake -DCMAKE_BUILD_TYPE=Release -DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX} -DCMAKE_INSTALL_PREFIX=#{prefix} ."
        system "make"
        system "cmake ."
        system "make install"
    end
end
