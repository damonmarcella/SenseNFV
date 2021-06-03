#!/bin/sh

/usr/local/bin/screen -d -m -e^xx -h 65535 /dev/nmdm0B 

/usr/local/sbin/grub-bhyve -m /root/device.map -r hd0,msdos1 -c /dev/nmdm0A openwrt
/usr/sbin/bhyve -A -H -P -s 0:0,hostbridge -s 1:0,lpc -s 2:0,virtio-net,tap0 -s 3:0,virtio-blk,/root/openwrt.img -l com1,/dev/nmdm0A openwrt &
  
