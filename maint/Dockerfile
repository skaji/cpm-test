FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y \
  build-essential git wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN git clone https://github.com/skaji/perl-install

RUN perl-install/perl-install 5.40.0 /tmp/perl-5.40.0 && \
  tar cJf perl-5.40.0.tar.xz -C /tmp perl-5.40.0

FROM scratch
COPY --from=builder /perl-5.40.0.tar.xz /
