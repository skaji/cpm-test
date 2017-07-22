use strict;
use warnings;
use Test::More tests => 9;
use lib "lib";
use CLI;

my $r = cpm_install "App::FatPacker";
is $r->exit, 0;
ok !$r->out;
like $r->err, qr/DONE install App-FatPacker-/;
diag $r->err;

$r = cpm_install "HTTP::Tinyish";
is $r->exit, 0;
ok !$r->out;
like $r->err, qr/DONE install HTTP-Tinyish-/;
diag $r->err;

$r = cpm_install "Process::Pipeline";
is $r->exit, 0;
ok !$r->out;
like $r->err, qr/DONE install Process-Pipeline-/;
diag $r->err;
