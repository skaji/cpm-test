FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install -y build-essential wget curl tar gzip perl patch libssl-dev

RUN curl -sSL http://cpanmin.us | perl - -nq Devel::PatchPerl

RUN mkdir /tmp/src
ADD build.sh /tmp/src/build.sh

RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/J/JH/JHI/perl-5.8.1.tar.gz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/D/DA/DAPM/perl-5.10.1.tar.gz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/R/RJ/RJBS/perl-5.16.3.tar.gz
RUN cd /tmp/src && ./build.sh https://cpan.metacpan.org/authors/id/X/XS/XSAWYERX/perl-5.26.0.tar.gz

CMD ["sleep", "infinity"]

# docker cp 63750560a8a1:/tmp/ubuntu-14.04-perl-5.8.1.tar.gz  .
# docker cp 63750560a8a1:/tmp/ubuntu-14.04-perl-5.10.1.tar.gz .
