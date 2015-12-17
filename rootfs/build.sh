#!/bin/bash

echo -e "#########\n# build rootfs #\n#########"
docker build -t rootfs:dev -f Dockerfile.rootfs .
docker run --name create-rootfs --privileged -v $(pwd)/result:/data rootfs:dev
docker commit create-rootfs rootfs:build
docker rm -vf create-rootfs

echo -e "#########\n# add configs #\n#########"
docker build -t aarch64 -f Dockerfile .

#echo -e "#######\n# run to get final archive#\n#######"
#docker run --rm -v $(pwd)/result:/data aarch64

echo -e "#######\n# get all layers #\n#######"
docker save --output=aarch64_image.tar aarch64 
docker history aarch64

echo "set owner for this subtree"
sudo chown -R $USER:$USER .

layer () {
NAME=$1
LAYER_ID=$(docker history aarch64 | grep "echo "$NAME |awk '{print $1}')
LAYER=$(tar tf aarch64_image.tar |grep $LAYER_ID.*/layer.tar)
tar -xf aarch64_image.tar $LAYER
mv $LAYER result/layer_$NAME.tar
rm -r $LAYER_ID*
}

echo -e "#######\n# get rootfs layer #\n#######"
layer rootfs

echo -e "#######\n# get tools layer #\n#######"
layer tools

echo -e "#######\n# get conf layer #\n#######"
layer config

#tar czf all.tar.gz rootfs.tar tools.tar config.tar

ls -lah . result/

