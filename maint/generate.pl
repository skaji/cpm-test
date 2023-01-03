#!/usr/bin/env perl
use v5.36;
use experimental qw(builtin defer for_list try);

my @v = qw(5.8.1 5.10.1 5.16.3 5.18.4 5.36.0);
my $ubuntu_version = '22.04';

my $f1 = <<'EOF';
RUN perl-install/perl-install $v /tmp/perl-$v && \
  tar cJf perl-$v.tar.xz -C /tmp perl-$v
EOF

my $f2 = <<'EOF';
docker cp $ID:/perl-$v.tar.xz ubuntu-$ubuntu_version-perl-$v.tar.xz
EOF

for my $v (@v) {
    my $f = $f1 =~ s/\$v/$v/gr;
    print $f;
}

print <<'EOF';

docker build -t cpm-test .
ID=$(docker create cpm-test)
EOF
for my $v (@v) {
    my $f = $f2 =~ s/\$v/$v/gr;
    $f =~ s/\$ubuntu_version/$ubuntu_version/g;
    print $f;
}
