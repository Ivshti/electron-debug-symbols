#!/usr/bin/env bash

if [ ! $1 ]; then 
	echo "must provide electron version: usage $0 ELECTRON_VERSION"
	exit 1
fi

# TODO: allow installing debug symbols for multiple electron versions  through passing a var $ELECTRON_VERSIONS

VERSIONS=$@
if [ "$ELECTRON_VERSIONS" ]; then
	VERSIONS=$ELECTRON_VERSIONS
fi

for VERSION in "$VERSIONS"
do

	mkdir -p symbols/{win32-$VERSION,darwin-$VERSION,linux-$VERSION}

	if [ `which bsdtar` ] && [ ! $FORCE_UNZIP ]; then 
		cmd="bsdtar -xvf-"
		( cd symbols/win32-$VERSION ; wget -O - https://github.com/atom/electron/releases/download/v${VERSION}/electron-v${VERSION}-win32-ia32-symbols.zip | $cmd )
		( cd symbols/darwin-$VERSION ; wget -O - https://github.com/atom/electron/releases/download/v${VERSION}/electron-v${VERSION}-darwin-x64-symbols.zip | $cmd )
		( cd symbols/linux-$VERSION; wget -O - https://github.com/atom/electron/releases/download/v${VERSION}/electron-v${VERSION}-linux-x64-symbols.zip | $cmd )
	elif [ `which unzip` ]; then
		cmd="unzip -x"
		( cd symbols/win32-$VERSION ; wget -O - https://github.com/atom/electron/releases/download/v${VERSION}/electron-v${VERSION}-win32-ia32-symbols.zip > /tmp/win32.zip ; $cmd /tmp/win32.zip )
		( cd symbols/darwin-$VERSION ; wget -O - https://github.com/atom/electron/releases/download/v${VERSION}/electron-v${VERSION}-darwin-x64-symbols.zip > /tmp/darwin.zip ; $cmd /tmp/darwin.zip )
		( cd symbols/linux-$VERSION ; wget -O - https://github.com/atom/electron/releases/download/v${VERSION}/electron-v${VERSION}-linux-x64-symbols.zip > /tmp/linux.zip ; $cmd /tmp/linux.zip )	
	fi


done
