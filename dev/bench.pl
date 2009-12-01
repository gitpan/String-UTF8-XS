#!/usr/bin/perl

use strict;
use warnings;

use Benchmark        qw[];
use String::UTF8::PP qw[];
use String::UTF8::XS qw[];

my $string = do {
    open( my $fh, '<', 'quickbrown.txt')
      || die(qq/Couldn't open 'quickbrown.txt': '$!'/);
    local $/; <$fh>;
};

printf "\nBenchmark String::UTF8 PP vs XS (string size: %d bytes):\n", length($string);

Benchmark::cmpthese( -10, {
    'PP' => sub { 
        String::UTF8::PP::is_utf8($string);
    },
    'XS' => sub {
        String::UTF8::XS::is_utf8($string);
    },
});
