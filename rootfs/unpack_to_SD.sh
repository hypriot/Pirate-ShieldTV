#!/bin/bash

untar () {
NAME=$1
DRIVE=$2
sudo tar xvf $NAME.tar --strip-components 1 -C $DRIVE
}

: << EOM
ID=/media/andreas/11c08d46-84fa-4990-b4c4-811743d882b8

untar result/layer_rootfs $ID
untar result/layer_tools $ID
untar result/layer_config $ID

sudo sync
umount $ID
EOM
