#!/bin/python3
import os
import time
import subprocess

def getip(inter):
    ipaddr = subprocess.check_output(['ip', 'addr', 'show', inter]).decode("utf-8");
    ipaddr = ipaddr.strip().split();
    if ("inet" in ipaddr):
        ipaddr = ipaddr[ipaddr.index("inet")+1][:-3];
    else:
        ipaddr = False;
    return ipaddr;

ipEth  = getip("enp0s25");
ipWifi = getip("wlp3s0");

if (ipEth):
    print(ipEth);
elif(ipWifi):
    time.sleep(.5);
    print(ipWifi);
else:
    time.sleep(.5);
    print("No internet");
