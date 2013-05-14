#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Uninets::Check::Modules::File' ) || print "Bail out!\n";
}

diag( "Testing Uninets::Check::Modules::File $Uninets::Check::Modules::File::VERSION, Perl $], $^X" );
