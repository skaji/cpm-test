FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y build-essential wget curl tar gzip bzip2 xz-utils perl patch libssl-dev

RUN curl -fsSL http://cpanmin.us | perl - -nq Devel::PatchPerl

RUN mkdir /tmp/src
ADD build.sh /tmp/src/build.sh

RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/J/JH/JHI/perl-5.8.1.tar.gz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/D/DA/DAPM/perl-5.10.1.tar.gz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/R/RJ/RJBS/perl-5.16.3.tar.gz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/S/SH/SHAY/perl-5.26.2.tar.xz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/X/XS/XSAWYERX/perl-5.28.0.tar.xz

CMD ["sleep", "infinity"]

# docker cp 63750560a8a1:/tmp/ubuntu-14.04-perl-5.8.1.tar.gz  .
# docker cp 63750560a8a1:/tmp/ubuntu-14.04-perl-5.10.1.tar.gz .
