#!/bin/bash
scanimage --device-name "hpaio:/usb/Deskjet_2050_J510_series?serial=CN14I33J2G05D1" --resolution=300 --mode=color -p --format=tiff > /tmp/image_scan.tiff
convert /tmp/image_scan.tiff /tmp/pdf_scan.pdf
ps2pdf /tmp/pdf_scan.pdf /tmp/pdf_light.pdf
mv /tmp/pdf_light.pdf $PWD/$1
