#! /bin/bash

set -xe

wget https://mirror.iscas.ac.cn/loongarch/archlinux/extra/os/loong64/cppdap-$CPPDAP_VERSION-1-loong64.pkg.tar.zst -O- | \
zstd -d | tar x --strip-components=1 -C /deps
