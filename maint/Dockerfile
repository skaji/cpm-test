FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y build-essential wget curl tar gzip perl patch libssl-dev

RUN curl -sSL http://cpanmin.us | perl - -nq Devel::PatchPerl

RUN mkdir /tmp/src

RUN cd /tmp/src && \
  wget -q https://cpan.metacpan.org/authors/id/J/JH/JHI/perl-5.8.1.tar.gz && \
  tar xzf perl-5.8.1.tar.gz && \
  patchperl perl-5.8.1 5.8.1 && \
  cd perl-5.8.1 && \
  ./Configure -Dman1dir=none -Dman3dir=none -Dprefix=/tmp/perl-5.8.1 -des && \
  make install
RUN cd /tmp && \
   tar czf ubuntu-14.04-perl-5.8.1.tar.gz perl-5.8.1

RUN cd /tmp/src && \
  wget -q https://cpan.metacpan.org/authors/id/D/DA/DAPM/perl-5.10.1.tar.gz && \
  tar xzf perl-5.10.1.tar.gz && \
  patchperl perl-5.10.1 5.10.1 && \
  cd perl-5.10.1 && \
  ./Configure -Dman1dir=none -Dman3dir=none -Dprefix=/tmp/perl-5.10.1 -des && \
  make install
RUN cd /tmp && \
   tar czf ubuntu-14.04-perl-5.10.1.tar.gz perl-5.10.1

RUN cd /tmp/src && \
  wget -q https://cpan.metacpan.org/authors/id/R/RJ/RJBS/perl-5.16.3.tar.gz && \
  tar xzf perl-5.16.3.tar.gz && \
  patchperl perl-5.16.3 5.16.3 && \
  cd perl-5.16.3 && \
  ./Configure -Dman1dir=none -Dman3dir=none -Dprefix=/tmp/perl-5.16.3 -des && \
  make install
RUN cd /tmp && \
   tar czf ubuntu-14.04-perl-5.16.3.tar.gz perl-5.16.3

CMD ["sleep", "infinity"]

# docker cp 63750560a8a1:/tmp/ubuntu-14.04-perl-5.8.1.tar.gz  .
# docker cp 63750560a8a1:/tmp/ubuntu-14.04-perl-5.10.1.tar.gz .
