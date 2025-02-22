#!/usr/bin/env sh

set -o nounset
set -o errexit

if   echo $distribID | egrep "centos|rhel|fedora" -q;then
	ipcalc="ipcalc -b"
elif echo $distribID | egrep "debian|ubuntu" -q;then
	ipcalc=ipcalc
fi

jollaUSBNetwork=192.168.2.14/31
jollaUSBIP=$($ipcalc $jollaUSBNetwork | awk '/HostMax:/{print$2}')
jollaUSBInterface=usb0
ifconfig $jollaUSBInterface >/dev/null || exit
if ! route -n | grep -q $jollaUSBInterface
then
[ $(id -ru) != 0 ] && sudo ifconfig $jollaUSBInterface inet $jollaUSBNetwork || ifconfig $jollaUSBInterface inet $jollaUSBNetwork
nc -v -z -w 5 $jollaUSBIP ssh
fi
