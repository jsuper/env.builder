#!/bin/bash

### This script is used to install golang development environment
BASEDIR=$(dirname `readlink -f "$0"`)
LOGIN_USER=$(who|awk '{print $1}'|uniq)
### install from local file
install_from_local () {
    extension_name="${1##*.}"
    file_name=$1

    case $extension_name in
	
	tar.gz | gz)
            mkdir -p /opt/golang/sdk
	    cp $1 /opt/golang/sdk
	    cd /opt/golang/sdk
	    pwd
	    tar xvf $file_name
	    target=`ls -l | grep '^d.*go'|awk '{print $9}'`
	    golang_home=\"`pwd`\/$target\"
	    echo GO_HOME=$golang_home>>$BASEDIR/../set-env.sh
	    echo PATH=\"\$PATH:\$GO_HOME/bin\">>$BASEDIR/../set-env.sh
	    echo>>$BASEDIR/../set-env.sh
	    source /home/$LOGIN_USER/.bash_profile
	    echo "Golang sdk install successfully"
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
    install_from_local $1
else
    install_from_network
fi


