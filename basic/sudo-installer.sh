#!/bin/bash

### install from local file
install_from_local () {
   echo "install from local"
}

install_from_network () {
   exist=`dpkg -l | grep sudo | awk '{print $1}'`
   if [ -z $exist ];then
	apt-get install sudo -y
   fi
   login_user=`who|awk '{print $1}'|uniq`
   echo "current login user is $login_user"
   exist_sudo_group=sed -n '/^%sudo/p' < /etc/sudoers
   chmod 755 /etc/sudoers
   sed '/^root[[:blank:]]*ALL=/a\'"$login_user"'    ALL=(ALL:ALL) ALL' -i /etc/sudoers
   chmod 0440 /etc/sudoers	   	
   echo "install sudo access right for $login_user finished"
}

if [ -f "$1" ]; then
    install_from_local $1
else
    install_from_network
fi


