FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y \
  build-essential git wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN git clone https://github.com/skaji/perl-install

RUN perl-install/perl-install 5.8.1 /tmp/perl-5.8.1 && \
  tar cJf perl-5.8.1.tar.xz -C /tmp perl-5.8.1
RUN perl-install/perl-install 5.10.1 /tmp/perl-5.10.1 && \
  tar cJf perl-5.10.1.tar.xz -C /tmp perl-5.10.1
RUN perl-install/perl-install 5.16.3 /tmp/perl-5.16.3 && \
  tar cJf perl-5.16.3.tar.xz -C /tmp perl-5.16.3
RUN perl-install/perl-install 5.18.4 /tmp/perl-5.18.4 && \
  tar cJf perl-5.18.4.tar.xz -C /tmp perl-5.18.4
RUN perl-install/perl-install 5.36.0 /tmp/perl-5.36.0 && \
  tar cJf perl-5.36.0.tar.xz -C /tmp perl-5.36.0
