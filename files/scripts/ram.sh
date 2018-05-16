#!/bin/bash
free -m | grep Mem | awk '{printf("🐌 %.2f / %.2f Go", $3/1000, $2/1000)}'

