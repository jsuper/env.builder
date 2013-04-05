#!/bin/bash

# Main installer for environment builder
login_user=`who|awk '{print $1}'|uniq`
builder_dir="/home/$login_user/.builder"
bash_profile="/home/$login_user/.bash_profile"
env_sh="$builder_dir/env.sh"

#check the given file is exist, if not then create it
create_file_if_not_exist() {
    if [ ! -f $1 ];then
	touch $1
    fi
}

#check the given dir is existed, if not then create it
create_dir_if_not_exist() {
    if [ ! -d $1 ];then
	mkdir $1
    fi
}

#check ~/.builder is exist, if not exist, then create it
create_dir_if_not_exist $builder_dir

#check env.sh file is exist
create_file_if_not_exist $env_sh

#check .bash_profile file is exist
create_file_if_not_exist $bash_profile

#add ~/.builder/env.sh to .bash_profile
env_has_install_to_bash_profile=`sed -n '/env.sh/p' < $bash_profile`
if [ -z "$env_has_install_to_bash_profile" ];then
    echo ". $env_sh">>$bash_profile
fi

#install java development toolkit
#sh ./java/jdk-installer.sh /home/commons/installer-repos/jdk/1.7.17/x64/jdk.tar.gz $login_user $builder_dir

#install golang 
sh ./golang/golang-installer.sh /home/commons/installer-repos/golang/1.0.3/x64/go.tar.gz $login_user $builder_dir

source $bash_profile

