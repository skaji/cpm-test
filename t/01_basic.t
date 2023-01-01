use strict;
use warnings;
use Test::More tests => 9;
use lib "lib";
use CLI;

my $cpm_path = cpm_path;
die "$cpm_path does not exist, abort\n" unless -f $cpm_path;

_diag "Use $cpm_path";

my $r = cpm_install "App::FatPacker";
is $r->exit, 0;
ok !$r->out;
like $r->err, qr/DONE install App-FatPacker-/;
_diag $r->err;

$r = cpm_install "HTTP::Tinyish";
is $r->exit, 0;
ok !$r->out;
like $r->err, qr/DONE install HTTP-Tinyish-/;
_diag $r->err;

$r = cpm_install "CPAN::Test::Dummy::Perl5::ModuleBuild";
is $r->exit, 0;
ok !$r->out;
like $r->err, qr/DONE install CPAN-Test-Dummy-Perl5-ModuleBuild-/;
_diag $r->err;
