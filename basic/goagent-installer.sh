#!/bin/bash

### install from local file
install_from_local () {
   echo "install from local"
}

install_from_network () {
    apt-get install python-dev python-gevent libnss3-tools
    wget http://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.13.tar.gz#md5=767bca18a71178ca353dff9e10941929
    tar zxvf pyOpenSSL-0.13.tar.gz
    cd pyOpenSSL-0.13
    python setup.py build_ext -I/usr/local/ssl/include -L/usr/local/ssl/lib
    python setup.py install
}

if [ -f "$1" ]; then
    install_from_local $1
else
    install_from_network
fi


