#!/bin/bash

untar () {
NAME=$1
DRIVE=$2
sudo tar xvf $NAME.tar --strip-components 1 -C $DRIVE
}


:<< EOM
ID=$1

untar result/layer_rootfs /media/$USER/$ID
untar result/layer_tools /media/$USER/$ID
untar result/layer_config /media/$USER/$ID

EOM
