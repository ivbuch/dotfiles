mnt="/mnt/flash-drive"
sudo mkdir -p -v "$mnt"
sudo mount -t ntfs /dev/sdc1 "$mnt" -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
echo "Drive mount on $mnt"
cd $mnt
