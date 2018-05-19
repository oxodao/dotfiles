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

ipEth = getip("enp3s0");
ipWif = getip("enp3s0"); # No wifi on my desktop so for shake of not breaking everything everywhere I just set both to the same interface

if (ipEth):
    print(ipEth);

if (ipWif):
    time.sleep(.5);
    print(ipWif);

