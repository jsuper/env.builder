#!/usr/bin/env python
# -*- coding:utf-8 -*-
# This is the entrance of the env builder
# @author Tang Ling
# @email tangling.life@gmail.com

import sys
import os

def print_usage():
    os.system('cat README')

def parsing_ins_scripts(script_name):
    script_file = open(script_name)
    line = script_file.readline()
    start = False
    while line:
        if (not start) and line.startswith('### BEGIN INFO'):
            start=True
        if start and line.startswith('### END INFO'):
            start=False
            break
        if start and (not line.startswith('###')) :
            data = line.split(':')
            print data
        line = script_file.readline()

def entrance():
    script_name = sys.argv[1] + '-install.sh'
    parsing_ins_scripts(script_name)
            
        

if __name__=="__main__":
    args = len(sys.argv)
    print sys.argv
    if args < 2:
        print_usage()
    else:
        entrance()


