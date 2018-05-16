#!/bin/python3
import os
import subprocess

FNULL = open(os.devnull, 'w');
retcode = subprocess.call(['playerctl', 'status'], stdout=FNULL, stderr=subprocess.STDOUT);

if(retcode == 0):
    a = subprocess.check_output(['playerctl', 'metadata', 'xesam:albumArtist']);
    b = subprocess.check_output(['playerctl', 'metadata', 'xesam:title']);
    c = a.decode("utf-8") + " - " + b.decode("utf-8");
    print("♫ " + c[:35]);
else:
    print("♫  None  ");

