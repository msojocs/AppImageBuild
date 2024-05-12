#! /bin/bash

set -eo pipefail
if [ "$ARCH" == "i386" ];then
    source /opt/rh/devtoolset-9/enable
else
    source /opt/rh/devtoolset-10/enable
fi

export PATH=/deps/bin/:"$PATH"
export PKG_CONFIG_PATH=/deps/lib/pkgconfig:"$PKG_CONFIG_PATH"

exec "$@"
