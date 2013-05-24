#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'App::Unicheck::Modules::File' ) || print "Bail out!\n";
}

diag( "Testing App::Unicheck::Modules::File $App::Unicheck::Modules::File::VERSION, Perl $], $^X" );
