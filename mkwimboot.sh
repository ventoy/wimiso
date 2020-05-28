#!/bin/sh

rm -f ventoy_wimboot.*

cd wimiso

option='-d -R -U -max-iso9660-filenames -D'

size=$(stat -c '%s' ./boot/etfsboot.com)
if [ $size -eq 4096 ]; then
    loadsize=8
else
    loadsize=4
fi

mkisofs $option -no-emul-boot -boot-load-size $loadsize -b boot/etfsboot.com  -eltorito-alt-boot -no-emul-boot -e  efi.img  -o ../ventoy_wimboot.img ./ 

cd ..
