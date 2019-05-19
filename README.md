Given a regular expressions, creates a list containing all strings which match it.

For example, given the regex `ab(c|d)`, you'd get this:

```
λ> set $ Concat (Item 'a') (Concat (Item 'b') (Alternate (Item 'c') (Item 'd')))
["abc","abd"]
```

For `xy*`, you'd get this:

```
λ> take 10 . set $ Concat (Item 'x') (Kleene (Item 'y'))
["xy","xyy","xyyy","xyyyy","xyyyyy","xyyyyyy","xyyyyyyy","xyyyyyyyy","xyyyyyyyyy","xyyyyyyyyyy"]
```