#!/usr/bin/env perl6

use v6;

use Text::Markdown;

sub MAIN( Str $letter-to-santa = 'dear-santa.md' ) {
    my $letter = Text::Markdown::Document.new($letter-to-santa.IO.slurp());
    say so $letter.items.grep( { $^þ ~~ Text::Markdown::Heading } );
}
			     
