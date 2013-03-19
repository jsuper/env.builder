#!/bin/bash

### This script is used to install java development toolkit
BASEDIR=$(dirname `readlink -f "$0"`)
### install from local file
install_from_local () {
    extension_name="${1#*.}"
    file_name="${1##*/}"

    case $extension_name in

	tar.gz)
            mkdir -p /opt/java/jdk
	    cp $1 /opt/java/jdk
	    cd /opt/java/jdk
	    pwd
	    tar xvf $file_name
	    target=`ls -l | grep '^d.*jdk'|awk '{print $9}'`
	    java_home=\"`pwd`\/$target\"
	    echo JAVA_HOME=$java_home>>$BASEDIR/../set-env.sh
	    echo PATH=\"\$PATH:\$JAVA_HOME/bin\">>$BASEDIR/../set-env.sh
	    echo>>$BASEDIR/../set-env.sh
	    source /home/anylinux/.bash_profile
	    echo "Java Development Toolkit is installed successfully"
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


