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
