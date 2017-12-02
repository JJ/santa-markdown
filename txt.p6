#!/usr/bin/env perl6

use JSON::Tiny;

sub MAIN( Str $letter-to-santa = 'letters/dear-santa.txt' ) {
    say to-json $letter-to-santa.IO.slurp().split(/«and»/);
}

