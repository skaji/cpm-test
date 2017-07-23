export HARNESS_COLOR = 1

test:
	perl -MTest::Harness -e 'runtests(@ARGV)' t/*
