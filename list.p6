#!/usr/bin/env perl6

use v6;

use Text::Markdown;
use JSON::Tiny;

sub MAIN( Str $letter-to-santa = 'letters/dear-santa-list.md' ) {
    my $letter = Text::Markdown::Document.new($letter-to-santa.IO.slurp());
    my $flip = False;
    my $list =  $letter.items
    .grep( { $flip = ( $flip
		      or so ($^þ ~~  Text::Markdown::Heading
			     and $^þ.level == 2
			     and $^þ.text ~~ m/<[Rr]>equest/) ) } )
    .grep( { $^þ ~~  Text::Markdown::List })
    .map( { $^þ.items });
    say $list[0][0].items ;
}
			     
