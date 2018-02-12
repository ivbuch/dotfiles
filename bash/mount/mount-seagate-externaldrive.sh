DEST="/mnt/seagate-drive"
sudo mkdir -p -v $DEST
sudo mount -t ntfs /dev/sdd1 $DEST
echo $DEST mounted
