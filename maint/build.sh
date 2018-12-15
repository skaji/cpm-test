#!/bin/bash


URL="$1"

TARBALL=$(basename "$URL")
NAME="${TARBALL%.*.*}"
PERL_VERSION="${NAME##*-}"

set -eux

curl -fsSL -o "$TARBALL" "$URL"
tar xf "$TARBALL"
patchperl "$NAME" "$PERL_VERSION"
cd "$NAME"
./Configure -Dman1dir=none -Dman3dir=none -Dprefix="/tmp/$NAME" -des
make install
cd /tmp

VERSION=$(/tmp/$NAME/bin/perl -F= -anle 'print $F[-1] if /DISTRIB_RELEASE/' /etc/lsb-release)
tar cJf ubuntu-$VERSION-$NAME.tar.xz $NAME
