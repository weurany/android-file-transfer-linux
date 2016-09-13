#!/bin/bash

DYLIBS=`otool -L android-file-transfer.app/Contents/MacOS/android-file-transfer | grep "/usr/local" | awk -F' ' '{ print $1 }'`
for dylib in $DYLIBS; do cp -rf $dylib android-file-transfer.app/Contents/MacOS/; done;
for dylib in $DYLIBS; do install_name_tool -change $dylib @executable_path/`basename $dylib` android-file-transfer.app/Contents/MacOS/android-file-transfer; done;

DYLIBS=`otool -L android-file-transfer.app/Contents/MacOS/QtGui | grep "/usr/local/Cellar" | awk -F' ' '{ print $1 }'`
for dylib1 in $DYLIBS; do cp -rf $dylib1 android-file-transfer.app/Contents/MacOS/; done;
for dylib1 in $DYLIBS; do install_name_tool -change $dylib1 @executable_path/`basename $dylib1` android-file-transfer.app/Contents/MacOS/QtGui; done;

