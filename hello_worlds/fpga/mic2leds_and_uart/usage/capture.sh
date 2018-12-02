#!/bin/sh

PORT=/dev/ttyUSB0

sudo stty -F $PORT raw speed 115200

sudo cat $PORT > ./data.bin



