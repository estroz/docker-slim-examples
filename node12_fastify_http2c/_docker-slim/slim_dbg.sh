#!/usr/bin/env bash

set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
BDIR="$( cd -P "$( dirname "$SOURCE" )/.." && pwd )"

pushd $BDIR
source _docker-slim.env

docker-slim --debug build --show-clogs --http-probe-cmd=http2.insecure:GET:/info --http-probe=false dslimexamples/$IMAGE_NAME
popd
