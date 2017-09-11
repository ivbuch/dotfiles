DEST="/mnt/seagate-drive"
sudo mkdir -p -v $DEST
sudo mount -t vfat /dev/sdd1 $DEST -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
echo $DEST mounted
