#!/bin/bash
free -m | grep Mem | awk '{printf(" %.2fGo", $3/1000)}'
