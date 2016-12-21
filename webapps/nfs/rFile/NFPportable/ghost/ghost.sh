#!/bin/bash
# GHOST will process net1.net and net2.net
echo ghost script start!
../ghost/GHOST -c ../ghost/ghost_test.cfg
# export cluster results in R
echo ghost script finish!
