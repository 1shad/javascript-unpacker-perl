#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;


BEGIN {
    plan tests => 1;
    use_ok( 'JavaScript::Unpacker' ) || print "Bail out!\n";
}

diag( "Testing JavaScript::Unpacker $JavaScript::Unpacker::VERSION, Perl $], $^X" );
