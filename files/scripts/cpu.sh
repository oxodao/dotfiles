#!/bin/bash
echo " $(sudo sensors | grep Package | cut -d":" -f2 | cut -d"(" -f1 | xargs | cut -d"+" -f2) "
