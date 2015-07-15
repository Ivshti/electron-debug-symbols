#!/usr/bin/env bash

if [ ! $1 ]; then 
	echo "must provide electron version: usage $0 ELECTRON_VERSION"
	exit 1
fi

mkdir -p symbols/{win32,darwin,linux}

if [ `which bsdtar` ] && [ ! $FORCE_UNZIP ]; then 
	cmd="bsdtar -xvf-"
	( cd symbols/win32 ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-win32-ia32-symbols.zip | $cmd )
	( cd symbols/darwin ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-darwin-x64-symbols.zip | $cmd )
	( cd symbols/linux ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-linux-x64-symbols.zip | $cmd )
elif [ `which unzip` ]; then
	cmd="unzip -x"
	( cd symbols/win32 ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-win32-ia32-symbols.zip > /tmp/win32.zip ; $cmd /tmp/win32.zip )
	( cd symbols/darwin ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-darwin-x64-symbols.zip > /tmp/darwin.zip ; $cmd /tmp/darwin.zip )
	( cd symbols/linux ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-linux-x64-symbols.zip > /tmp/linux.zip ; $cmd /tmp/linux.zip )	
fi

