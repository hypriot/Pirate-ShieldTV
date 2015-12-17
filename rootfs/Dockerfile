FROM rootfs:build
MAINTAINER Andreas Eiermann <andreas@hypriot.com>

# install some tools
RUN echo tools && chroot debian-arm64/ /bin/bash -c "\
apt-get update && \
apt-get install -y net-tools openssh-server htop && \
apt-get clean"

# set root password and some network settings
RUN echo config && echo 'root:shield'| chroot debian-arm64/ chpasswd \
&& chroot debian-arm64/ systemctl enable networking.service \
&& echo -e "auto eth0\niface eth0 inet dhcp\n" > \
debian-arm64/etc/network/interfaces.d/eth0.cfg

#tar and save all layers
CMD []
#tar -czf /data/all_layers_aarch64.tar.gz -C debian-arm64/ .
