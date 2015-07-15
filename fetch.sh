#!/usr/bin/env bash

if [ ! $1 ]; then 
	echo "must provide electron version: usage $0 ELECTRON_VERSION"
	exit 1
fi

mkdir -p symbols/{win32,darwin,linux}
( cd symbols/win32 ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-win32-ia32-symbols.zip | tar -xvf- )
( cd symbols/darwin ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-linux-x64-symbols.zip | tar -xvf- )
( cd symbols/linux ; wget -O - https://github.com/atom/electron/releases/download/v0.29.2/electron-v${1}-darwin-x64-symbols.zip | tar -xvf- )
