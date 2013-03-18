#!/bin/bash

### This script is used to install java development toolkit

### install from local file
install_from_local () {
    extension_name="${1#*.}"
    case $extension_name in

	tar.gz)
            echo is tar.gz
	    ;;
	
	zip)
	    echo is zip
	    ;;
	*)
	    echo "sorry the file you specified is not a valid type"
    esac
}

### Downlaod the installation package and install it
install_from_network () {
    echo "install from network"
}

if [ -f "$1" ]; then
    install_from_local
else
    install_from_network
fi