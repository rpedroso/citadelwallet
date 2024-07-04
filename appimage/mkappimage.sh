#!/bin/bash

if ! test -f "linuxdeploy-x86_64.AppImage"; then
    wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
fi
if ! test -f "linuxdeploy-plugin-qt-x86_64.AppImage"; then
    wget https://github.com/linuxdeploy/linuxdeploy-plugin-qt/releases/download/continuous/linuxdeploy-plugin-qt-x86_64.AppImage
fi
chmod u+x ./*.AppImage
cp ../build/release/citadelwallet .
mkdir -p AppDir/usr/lib
# cp /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 usr/lib
# cp /usr/lib/x86_64-linux-gnu/libssl.so.1.1 usr/lib
./linuxdeploy-x86_64.AppImage --executable ./citadelwallet --desktop-file ../src/citadelwallet.desktop --appdir ./AppDir --output appimage --plugin qt --icon-file ../src/images/citadel.png
