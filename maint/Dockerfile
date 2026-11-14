FROM ubuntu:26.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y \
  build-essential git wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN git clone https://github.com/skaji/perl-install

RUN <<EOF bash
set -euxo pipefail

perl-install/perl-install --show-log-on-failure 5.24.4 /tmp/perl-5.24.4
perl-install/perl-install --show-log-on-failure latest /tmp/perl-latest
tar cJf perl-5.24.4.tar.xz -C /tmp perl-5.24.4
tar cJf perl-latest.tar.xz -C /tmp perl-latest
EOF

FROM scratch
COPY --from=builder /perl-*.tar.xz /
