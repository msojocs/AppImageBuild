#! /bin/bash

set -eo pipefail

export PATH=/deps/bin/:"$PATH"
export PKG_CONFIG_PATH=/deps/lib/pkgconfig:"$PKG_CONFIG_PATH"

echo "start exec for archlinux"
ls -l
exec "$@"
