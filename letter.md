## Scale

"Scale! Scale is everything!". 

Elves scattered in all directions when the booming voice of Santa reached them.

"This operation is prepared for, what, thirty four children? And now we have zillions of them! And adults are sending letters too!"

Buzzius the elf stepped forward and spurted "But now we have computers!", darting back again to his elvish pursuits.

"What good are they? Pray tell me, what can I do if I still have to read every single letter?".

Diodius the elf briefly raised his head from his hiding place and said "Tell the children to send a letter in a text file".

Santa stopped yelling and scratched his well-bearded chin. "I can do that". Early children adopters sent a letter just like this one.

```
Dear Santa: I have been a good boy so I want you to bring me a collection of ccythes and an ocean liner with a captain and a purser and a time travel machine and instructions to operate it and I know I haven't been so good at times but that is why I'm asking the time machine so that I can make it good and well and also find out what happened on July 13th which I completely forgot.
```

"I can do that?". Santa repeated to himself. He would have to extract a list of gifts out of that single-line mess. For instance, dividing it by *and*.

```
use JSON::Tiny;

sub MAIN( Str $letter-to-santa = 'dear-santa.txt' ) {
    say to-json "dear-santa.txt".IO.slurp().split(/and\s/);
}
```

And, of course, using Perl 6, which being able to use `$þ` as a variable, and even [runic](https://en.wikipedia.org/wiki/Runic_(Unicode_block)) `our $ᚣ = True` was his favorite language. In a single line you can get all the chunks obtaining something like this:

```
[ "Dear Santa: I have been a good boy so I want you to bring me a collection of ccythes ", "an ocean liner with a captain ", "a purser ", "a time travel machine ", "instructions to operate it ", "I know I haven't been so good at times but that is why I'm asking the time machine so that I can make it good ", "well ", "also find out what happened on July 13th which I completely forgot.\n" ]
```

Which made Santa start roaring again.
"Scale *and* structure! We need to scale and we need structure!"

## Markdown to the rescue

Marcius pitched in. "Everybody
knows
[Markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/). It's
text, with a few marks thrown in for structure."

Oakius, who was working towards his promotion to Elf, Second class, said. "Use the elvish-est language, Elm. You know, it's elf but for a letter"

"I can do that", said Santa. Elves loved his can do approach. So he
installed the whole thing and did this little program

```
import Html
import Markdown

letter : Html msg
letter =
   Markdown.toHtml [class "content"] """

# Letter to Santa

I've been *real* **good** so I want this for Christmas
  1. A Death Star.
  2. A green unicorn.

"""
```

Santa was quiet for about 30 seconds. And then his roaring could be
heard again.

"Never, you hear me? Never I want to hear again about this spawn from
the Easter Bunny or other evil creatures".

Those elves nearest the screen observed lots of red, but not nice red,
and nothing resembling working code. So they gave Rudolph the (nice)
Red Nose Reineer a note, which he dutifully carried pricked in one of
his smaller antlers. 

"Should we go back to Perl6 then?".

## Processing Markdown with Perl6

Santa
Found [Text::Markdown](https://github.com/retupmoca/p6-markdown),
which he promptly installed with 

    zef install Text::Markdown
	
It had Text, it had Markdown, it promised to process it, that was all
he needed. So he got word to his customer base that markdown was going
to be needed this year if you wanted *this* guy to go down your
chimney with a burlap bag with nice stuff in it. 

Once again, early adopters answered with this

```
# Dear Santa

I have been a good boy so I want you to bring me a collection of
scythes and an ocean liner with a captain and a purser and a time
travel machine and instructions to operate it and I know I haven't
been so good at times but that is why I'm asking the time machine so
that I can make it good and well and also find out what happened on
July 13th which I completely forgot.
```

Well, it is Markdown, is is not? It's properly addressed and
all. "Properly addressing a letter is important", Santa said aloud, in a
not-quite-yell that only startled Rudolph, which was the only one
hanging around. "It gives structure. Let us check whether letters have
this".

```
use Text::Markdown;

sub MAIN( Str $letter-to-santa = 'letters/dear-santa.md' ) {
    my $letter = Text::Markdown::Document.new($letter-to-santa.IO.slurp());
    say so $letter.items.grep( { $^þ ~~ Text::Markdown::Heading } );
}
```

"Wow!" Said Santa. And then, "Wow". Just a few lines of code, one to
read and understand the structure of the document, another one to
check if there is at least one that is a heading. It will say `True`
if that is the case. And it was true.

Santa was happy for a tiny while. He scratched the scruff of the neck
of Rudolph, who was kind of surprised by this. Then he stopped doing
it. Rudolph looked up and backed his hind legs just this tiny bit,
feeling unhappiness.

## More structure is needed. 

Santa had found this letter:

```
# Dude

## Welll...

I have been a naughty person


## Requests

Well...
```

Proper addressing and everything, he could not waste his time with
persons that had not been good. Scale. And resources. Resources should
be spent only in good persons, not in bad persons. Bad persons are
bad, and that's that. So went back to coding, Rudolph slipped away
looking for lichen candy or whatever, and he produced this:

```
use Text::Markdown;

sub MAIN( Str $letter-to-santa = 'letters/dear-santa-sections.md' ) {
    my $letter = Text::Markdown::Document.new($letter-to-santa.IO.slurp());
    my $flip = False;
    my @paragraphs =  $letter.items.grep( { $flip = ($^þ ~~  Text::Markdown::Heading and $^þ.level == 2)?? !$flip !! $flip } );
    say so any @paragraphs.map( {$^þ.Str ~~ /good/ } );
}
```

Santa was kind of proud of the trick that extracted the paragraphs
after the second heading, as well as the fact that he had been able to
put to good use the Thorn letter, which he loved. He also loved
functional programming, having cut his teeth in Lisp. So he created
this flip-switch that is initially false but flips on when the element
it is dealing with is a heading and its level is two. He was also
happy that he could do this kind of thing with the structured layered
on top of the text by the marks. 

Besides, he could check whether the word "good" was present in any of
the paragraphs between that heading (**Behavior**) and the next. And
`any` is so cool. It is enough that one of the paragraph mentions
`good`. The last line will first return an array of Boolean values,
and will eventually say `True` if just one of them includes
`good`. False otherwise. Good for culling the good from the bad. 

Santa was happy. Er. But still.

## The toys are the important thing here.

So what he actually wanted was a list of the toys. After requesting,
once again, a change of letter format, which he could do because he
was Santa and everyone wanted his free stuff for Christmas, he started
to receive letters with this structure:

```
# Dear Santa

## Behavior

I have been a good boy 


## Requests

And this is what I want

 - scythes 
 - an ocean liner with a captain and a purser
 - a time travel machine and instructions to operate it 
```

What they lack in spontaneity they have in structure. And structure is
good. You can get a list of requests thus:

```
sub MAIN( Str $letter-to-santa = 'letters/dear-santa-list.md' ) {
    my $letter = Text::Markdown::Document.new($letter-to-santa.IO.slurp());
    my $flip = False;
    my $list =  $letter.items
    .grep( { $flip = ( $flip
		      or so ($^þ ~~  Text::Markdown::Heading
			     and $^þ.level == 2
			     and $^þ.text ~~ m/<[Rr]>equest/) ) } )
    .grep( { $^þ ~~  Text::Markdown::List })
    .map( {$^þ.items} ).flat
    .map( {$^þ.items} ).flat
    .map( {$^þ.items} ).flat;
    
    say to-json $list ;

}
```

That is really an unsaintly list of chained list processing
expressions. And this sentence before this one has an list of list
mentions that is almost as bad. But let us see what is going on there.

First thing in the list, we take only what comes *after* the
**Requests** heading, using regular expressions and stuff. We could
have probably pared it down to a transformation to `Str` but we would
have lost the structure. And structure is important, Santa is never
tired of repeating that. Next we extract only those elements thar are
actually a list, taking out all the fluff. 

And it so happens that there is such a thing as too much
structure. The list has elements that have elements that have elements
in it. 

That, or [Text::Markdown](https://github.com/retupmoca/p6-markdown)
could do with a big makeover. Which is what the author of this post is
putting on his particular wish list. 

## Not there yet

But almost. We have the list, and now Santa finds things like time
travel machines and Mondays and things like that. He cannot order
Mondays in the elf factory. He would have to read every single list of
things. But no worries.





