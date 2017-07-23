#!/bin/bash


URL="$1"

TARBALL=$(basename "$URL")
NAME="${TARBALL%.*.*}"
PERL_VERSION="${NAME##*-}"

set -eux

curl -sSL -o "$TARBALL" "$URL"
tar xzf "$TARBALL"
patchperl "$NAME" "$PERL_VERSION"
cd "$NAME"
./Configure -Dman1dir=none -Dman3dir=none -Dprefix="/tmp/$NAME" -des
make install
cd /tmp
tar czf ubuntu-14.04-$NAME.tar.gz $NAME
