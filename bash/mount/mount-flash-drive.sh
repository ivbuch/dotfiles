#!/bin/bash

if [ "$#" -lt 2 ]; then  
  echo "Usage: device filesystem"
  exit 1
fi

mnt="/mnt/flash-drive"
sudo mkdir -p -v "$mnt"
case "$1" in
  "fat") sudo mount -t vfat "$1" "$mnt" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137 
    ;;
  "ntfs") sudo mount -t ntfs "$1" "$mnt" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137 
    ;;
esac    

echo "Drive mount on $mnt"
