#!/usr/bin/env python
# -*- coding:utf-8 -*-
# This is the entrance of the env builder
# @author Tang Ling
# @email tangling.life@gmail.com

import sys
import os

def print_usage():
    os.system('cat README')

def parsing_ins_scripts():
    script_name = sys.argv[3] + '-install.sh'
    script_file = open(script_name)
    line = script_file.readline()
    start = False
    while line:
        if !start && line.startswith('### BEGIN INFO'):
            start=True
        if start && line.startswith('### END INFO'):
            start=False
            break
        if start :
            
        

if __name__=="__main__":
    args = len(sys.argv)
    print sys.argv
    if args < 2:
        print_usage()
    else:
        entrance()


