FROM rootfs:build
MAINTAINER Andreas Eiermann <andreas@hypriot.com>

# install some tools
RUN echo tools && chroot debian-arm64/ /bin/bash -c "\
apt-get update && \
apt-get install -y net-tools openssh-server htop && \
apt-get clean"

# set root password and some network settings
RUN echo config \
&& echo 'root:shield'| chroot debian-arm64/ chpasswd \
&& echo "black-pearl" > debian-arm64/etc/hostname \
&& echo -e "[Match]\nName=eth0\n[Network]\nDHCP=yes" > \
debian-arm64/etc/systemd/network/eth.network \
&& sed -i 's|PermitRootLogin without-password|PermitRootLogin yes|g' \
debian-arm64/etc/ssh/sshd_config \
&& rm -f debian-arm64/etc/ssh/ssh_host*_key \
&& sed -i 's+exit 0+test -f /etc/ssh/ssh_host_dsa_key || ssh-keygen -t dsa -N "" -f \
/etc/ssh/ssh_host_dsa_key\ntest -f /etc/ssh/ssh_host_rsa_key || ssh-keygen -t rsa -N "" -f \
/etc/ssh/ssh_host_rsa_key\ntest -f /etc/ssh/ssh_host_ecdsa_key || ssh-keygen -t ecdsa -N "" -f \
/etc/ssh/ssh_host_ecdsa_key\n\nexit 0\n+g' debian-arm64/etc/rc.local \
&& chroot debian-arm64/ systemctl enable systemd-networkd

#tar and save all layers
CMD []
#tar -czf /data/all_layers_aarch64.tar.gz -C debian-arm64/ .
