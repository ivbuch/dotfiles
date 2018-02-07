MNT="/mnt/flash-drive"
sudo mkdir -p -v $MNT
sudo mount -t vfat /dev/sdc1 $MNT -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
cd $MNT
