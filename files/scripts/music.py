#!/bin/python3
import os
import subprocess

FNULL = open(os.devnull, 'w');
retcode = subprocess.call(['playerctl', 'status'], stdout=FNULL, stderr=subprocess.STDOUT);

if(retcode == 0):
    a = subprocess.check_output(['playerctl', 'metadata', 'xesam:albumArtist']).strip();
    b = subprocess.check_output(['playerctl', 'metadata', 'xesam:title']).strip();
    c = a.decode("utf-8") + " - " + b.decode("utf-8")[:35];
    if (c.strip() == "-"):
        print("♫ None ");
    else:
        print("♫ " + c[:35]);
else:
    print("♫  None  ");

