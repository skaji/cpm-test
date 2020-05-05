FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y build-essential git wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN git clone https://github.com/skaji/perl-install
RUN set -eux; \
  for v in 5.8.1 5.10.1 5.16.3 5.30.2; do \
    perl-install/perl-install --noman $v /tmp/perl-$v; \
    tar cJf perl-$v.tar.xz -C /tmp perl-$v; \
  done; \
  :

CMD ["sleep", "infinity"]
