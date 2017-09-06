sudo mkdir -p -v /media/kindle-book
sudo mount -t vfat /dev/sdb1 /media/kindle-book -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
cd /media/kindle-book/documents
