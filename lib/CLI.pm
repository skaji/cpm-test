package CLI;
use strict;
use warnings;
use utf8;
use File::Temp 'tempdir';
use base 'Exporter';
use IO::Handle;
use File::Basename ();
use File::Spec;
use Cwd 'abs_path';
our @EXPORT = qw(cpm_install with_same_local with_same_home _diag);

my $base = abs_path( File::Spec->catdir(File::Basename::dirname(__FILE__), "..") );

my $TEMPDIR = tempdir CLEANUP => 1;

{
    package Result;
    no strict 'refs';
    sub new {
        my $class = shift;
        bless {@_}, $class;
    }
    for my $attr (qw(local out err exit home logfile)) {
        *$attr = sub { shift->{$attr} };
    }
    sub success { shift->exit == 0 }
    sub log {
        my $self = shift;
        return $self->{_log} if $self->{_log};
        open my $fh, "<", $self->logfile or die "$self->{logfile}: $!";
        $self->{_log} = do { local $/; <$fh> };
    }
}

our ($_LOCAL, $_HOME);

sub with_same_local (&) {
    my $sub = shift;
    local $_LOCAL = tempdir DIR => $TEMPDIR;
    $sub->();
}
sub with_same_home (&) {
    my $sub = shift;
    local $_HOME = tempdir DIR => $TEMPDIR;
    $sub->();
}

sub cpm_install {
    my @argv = @_;
    my $local = $_LOCAL || tempdir DIR => $TEMPDIR;
    my $home  = $_HOME  || tempdir DIR => $TEMPDIR;
    open my $stdout, "+>", undef;
    open my $stderr, "+>", undef;
    my $pid = fork;
    die "fork: $!" unless defined $pid;
    if ($pid == 0) {
        open STDOUT, ">&", $stdout or die;
        open STDERR, ">&", $stderr or die;
        delete $ENV{$_} for grep /^PERL_CPM_/, keys %ENV;
        exec $^X, "-I$base/lib", "$base/cpm", "install", "-L", $local, "--home", $home, "--exclude-vendor", @argv;
        exit 255;
    }
    waitpid $pid, 0;
    my $exit = $?;
    my $out = do { seek $stdout, 0, 0; join '', <$stdout> };
    my $err = do { seek $stderr, 0, 0; join '', <$stderr> };
    my $logfile = "$home/build.log";
    Result->new(home => $home, local => $local, out => $out, err => $err, exit => $exit, logfile => $logfile);
}

my $flush = sub {
    STDOUT->flush;
    STDERR->flush;
    select undef, undef, undef, 0.1;
};

sub _diag {
    $flush->();
    Test::More::diag("\n", @_);
    $flush->();
}

1;
