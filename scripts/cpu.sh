#!/bin/bash
echo " $(sudo sensors | grep Tctl | cut -d":" -f2 | xargs) / $(sudo sensors | grep "edge:" | cut -d":" -f2 | cut -d"(" -f1 | xargs)"
