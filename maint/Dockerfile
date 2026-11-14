FROM ubuntu:26.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y \
  build-essential git wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN <<EOF bash
set -euxo pipefail

curl -fsSL -o cpm https://github.com/skaji/cpm/releases/latest/download/cpm | \
  perl - install -g https://github.com/skaji/perl-Devel-PatchPerl-SKAJI.git CPAN::Perl::Releases::MetaCPAN

mkdir src

(
  cd src
  curl -fsSL -O $(perl-release 5.24.4)
  tar xf perl-5.24.4.tar.gz
  cd perl-5.24.4
  perl -MDevel::PatchPerl::SKAJI -E 'Devel::PatchPerl::SKAJI->patchperl("5.24.4", ".")'
  ./Configure -des -Dprefix=/tmp/perl-5.24.4 -Dscriptdir=/tmp/perl-5.24.4/bin -Dman1dir=none -Dman3dir=none
  make install
)
tar cJf perl-5.24.4.tar.xz -C /tmp perl-5.24.4

(
  cd src
  curl -fsSL -O $(perl-release 5.44.0)
  tar xf perl-5.44.0.tar.gz
  cd perl-5.44.0
  ./Configure -des -Dprefix=/tmp/perl-latest -Dscriptdir=/tmp/perl-latest/bin -Dman1dir=none -Dman3dir=none
  make install
)
tar cJf perl-latest.tar.xz -C /tmp perl-latest
EOF

FROM scratch
COPY --from=builder /perl-*.tar.xz /
