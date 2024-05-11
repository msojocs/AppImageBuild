#! /bin/bash

set -e
set -x

case "$ARCH" in
    arm64*|aarch64)
       cmake_arch=arm64v8
       ;;
    arm32*|armhf)
       cmake_arch=armhf
       ;;
    i?86)
       cmake_arch=i386
       ;;
    *)
       cmake_arch="$ARCH"
       ;;
esac

case "$DIST" in
    "xenial"|"bionic")
        cmake_dist="ubuntu_$DIST"
        ;;
    *)
        cmake_dist="$DIST"
        ;;
esac

if [ "$cmake_arch" == "loongarch64" ];then
   apt install zstd
   # TODO
   wget https://mirrors.wsyu.edu.cn/loongarch/archlinux/extra/os/loong64/cmake-3.28.2-1-loong64.pkg.tar.zst -O- | \
    zstd -d | tar x --strip-components=1 -C /usr/local
else
   wget https://artifacts.assassinate-you.net/prebuilt-cmake/cmake-v3.19.1-"$cmake_dist"-"$cmake_arch".tar.gz -O- | \
      tar xz --strip-components=1 -C/usr/local
fi
