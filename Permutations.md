# Permutations

How can we generate all permutation of an array? How about [this code]?

However, this algorithm is `Θ(n!)`. Not very efficent!

[this code]: examples/ruby/mystory.rb

## Better solutions

```
permute(n)
  permute(n-1)
  isert n @ all possible locations in the results.
```

This algorithm does have some issues, one being that permutations are
not generated in order. Nor does it only swap consecutive values.

```
permute(n)
  end <- left
  p <- permute(n-1)
  for each item in p
    start at [end] and insert n in all possible positions
    toggle end // left -> right, right -> left
```

This algorithm lets us generate the permutations in consecutive order.

### Size aware algorithms

1. give each number a direction
2. a number is mobile if its arrow points to an adjacant smaller number

```
johnson-trotter(n)
  initialize A = [1..n]
  initialize D = [<-, <-, <-,...,<-]
  while there exists a mobile element
    k <- take the largest element in A
    swap k and the item it points to
    reverse the directions of all elements larger than k
```
