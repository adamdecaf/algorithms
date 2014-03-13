## Probabilistic Structures

### Bloom Filters

[Bloom Filters](http://en.wikipedia.org/wiki/Bloom_filter) are structures that give probabilistic
answers to questions of existence within a set. They answer with "possibly in set" or "definitely not in set."

* m-bit bit string
* k hash functions (name -> {1...m})

__Insertion / Lookup__

```
m = 11
0 1 0 1 0 1 0 0 1 0 1

hash1  3  5  2  3
hash2  10 1  3  5
hash3  8  3  4  8
```

__Deletion__

You can't. You can't always flip bits back away from representing existence because that bit may represent
existence of more than one value.

__Tradeoffs__

* Size vs Correctness
  * With a very small storage space we lose percision of the results.
