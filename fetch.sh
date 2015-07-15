#!/usr/bin/env bash

if [ ! $1 ]; then 
	echo "must provide electron version: usage $0 ELECTRON_VERSION"
	exit 1
fi
