FROM debian:jessie
MAINTAINER Andreas Eiermann <andreas@hypriot.com>

RUN apt-get update && \
apt-get install -y \
qemu qemu-user-static \
binfmt-support debootstrap


RUN apt-get install -y debian-ports-archive-keyring

CMD qemu-debootstrap --arch=arm64 --keyring \
/usr/share/keyrings/debian-archive-keyring.gpg \
--exclude=debfoster --include=net-tools jessie debian-arm64 http://ftp.debian.org/debian \
&& chroot debian-arm64/ /bin/bash -c "uname -a && echo 'root:shield'|chpasswd" \
&& tar -czf /data/aarch64.tar.gz -C debian-arm64/ .

#RUN chroot debian-arm64/ apt-get install -y debian-ports-archive-keyring

#RUN chroot debian-arm64/ apt-get install -y locales build-essential \
#gcc g++ gdb make subversion git curl zip unzip



