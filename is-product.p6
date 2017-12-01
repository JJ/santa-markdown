#!/usr/bin/env perl6

use v6;

use JSON::Tiny;
use Wikidata::API;

sub MAIN( Str $toy-list = 'list.json' ) {
    my $toys = from-json $toy-list.IO.slurp();
    
    say $toys.grep( { is-product( $^þ) } );
}

sub is-product( Str $item ) {
    my $query = q:to/END/;
SELECT DISTINCT ?item ?itemLabel WHERE {
  ?item (wdt:P31/wdt:P279*) wd:Q2424752.
  ?item rdfs:label ?itemLabel.
  FILTER(CONTAINS(LCASE(?itemLabel), 
END
    $query ~= '"' ~ $item ~ '"))}';
    my $result = query( $query );
    return so $result<results><bindings>.elems;
}
