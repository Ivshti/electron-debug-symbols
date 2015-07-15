#!/usr/bin/env bash

if [ ! $1 ]; then 
	echo "must provide electron version: usage $0 ELECTRON_VERSION"
	exit 1
fi

if [ `which bsdtar` ]; then 
	cmd="bsdtar -xvf-"
#elif [ `which unzip` ]; then
#	cmd="unzip x"
elif [ `which jar` ]; then #heroku case
	cmd="jar xvf"
else
	echo "error - unable to find a command to unzip electron debug symbols"
	exit 1
fi

mkdir -p symbols/{win32,darwin,linux}
( cd symbols/win32 ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-win32-ia32-symbols.zip | $cmd )
( cd symbols/darwin ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-linux-x64-symbols.zip | $cmd )
( cd symbols/linux ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-darwin-x64-symbols.zip | $cmd )
