FROM ubuntu:24.04 AS builder

ARG VERSIONS="5.8.1  5.10.1  5.16.3  5.18.4  5.40.0"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y \
  build-essential git wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN git clone https://github.com/skaji/perl-install

RUN <<EOF bash
  set -euxo pipefail
  for v in $VERSIONS; do
    perl-install/perl-install \$v /tmp/perl-\$v
    tar cJf perl-\$v.tar.xz -C /tmp perl-\$v
  done
EOF

FROM scratch
COPY --from=builder /perl-*.tar.xz /
