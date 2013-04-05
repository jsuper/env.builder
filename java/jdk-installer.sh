#!/bin/bash

### This script is used to install java development toolkit
BASEDIR=$(dirname `readlink -f "$0"`)
login_user=$2
builder_dir=$3
### install from local file
install_from_local () {
    extension_name="${1##*.}"
    file_name=$1
    case $extension_name in

	tar.gz | gz)
            mkdir -p /opt/java/jdk
	    cp $1 /opt/java/jdk
	    cd /opt/java/jdk
	    pwd
	    tar xvf $(basename $file_name)
	    target=`ls -l | grep '^d.*jdk'|awk '{print $9}'`
	    java_home=\"`pwd`\/$target\"
	    echo JAVA_HOME=$java_home>>$builder_dir/env.sh
	    echo PATH=\"\$PATH:\$JAVA_HOME/bin\">>$builder_dir/env.sh
	    echo>>$builder_dir/env.sh
	    
	    #config system default java and javac env
	    update-alternatives --set java `pwd`/$target/bin/java
	    update-alternatives --set javac `pwd`/$target/bin/javac

	    #clear installation
	    rm /opt/java/jdk/$(basename $file_name)
	    echo "Install successfully"
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


