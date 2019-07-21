#!/bin/bash

rm packages/mediacenter/kodi/patches/0*.patch
cp ~/Shared/kodi/0*.patch packages/mediacenter/kodi/patches

mkdir -p target-bak
mv target/* target-bak/

PROJECT=RPi DEVICE=RPi2 ARCH=arm ./scripts/clean kodi
PROJECT=RPi DEVICE=RPi2 ARCH=arm make

cp -r target/*.tar ~/Shared/target/
