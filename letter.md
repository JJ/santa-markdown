## Scale

"Scale! Scale is everything!". 

Elves scattered in all directions when the booming voice of Santa reached them.

"This operation is prepared for, what, thirty four children? And now we have zillions of them! And adults are sending letters too!"

Buzzius the elf stepped forward and spurted "But now we have computers!", darting back again to his elvish pursuits.

"What good are they? Pray tell me, what can I do if I still have to read every single letter?".

Diodius the elf briefly raised his head from his hiding place and said "Tell the children to send a letter in a text file".

Santa stopped yelling and scratched his well-bearded chin. "I can do that". Early children adopters sent a letter just like this one.

~~~
Dear Santa: I have been a good boy so I want you to bring me a collection of ccythes and an ocean liner with a captain and a purser and a time travel machine and instructions to operate it and I know I haven't been so good at times but that is why I'm asking the time machine so that I can make it good and well and also find out what happened on July 13th which I completely forgot.
~~~

"I can do that?". Santa repeated to himself. He would have to extract a list of gifts out of that single-line mess. For instance, dividing it by `and`.

~~~~
use JSON::Tiny;

sub MAIN( Str $letter-to-santa = 'dear-santa.txt' ) {
    say to-json "dear-santa.txt".IO.slurp().split(/and\s/);
}
~~~

And, of course, using Perl 6, which being able to use `$þ` as a variable, and even [runic](https://en.wikipedia.org/wiki/Runic_(Unicode_block)) `our $ᚣ = Tru` was his favorite language. In a single line you can get all the chunks obtaining something like this:
~~~
[ "Dear Santa: I have been a good boy so I want you to bring me a collection of ccythes ", "an ocean liner with a captain ", "a purser ", "a time travel machine ", "instructions to operate it ", "I know I haven't been so good at times but that is why I'm asking the time machine so that I can make it good ", "well ", "also find out what happened on July 13th which I completely forgot.\n" ]
~~~
Which made Santa start roaring again.
"Scale *and* structure! We need to scale and we need structure!"

## Markdown to the rescue.

Oakius the elf said. "Use the elvish-est language, Elm. You know, it's elf but for a letter"

