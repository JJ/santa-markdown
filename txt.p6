#!/usr/bin/env perl6

use JSON::Tiny;

sub MAIN( Str $letter-to-santa = 'dear-santa.txt' ) {
    say to-json "dear-santa.txt".IO.slurp().split(/and\s/);
}

