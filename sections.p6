#!/usr/bin/env perl6

use v6;

use Text::Markdown;

sub MAIN( Str $letter-to-santa = 'dear-santa-sections.md' ) {
    my $letter = Text::Markdown::Document.new($letter-to-santa.IO.slurp());
    my $flip = False;
    my @paragraphs =  $letter.items.grep( { $flip = ($^þ ~~  Text::Markdown::Heading and $^þ.level == 2)?? !$flip !! $flip } );
    say so any @paragraphs.map( {$^þ.Str ~~ /good/ } );
}
			     
