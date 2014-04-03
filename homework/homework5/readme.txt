## Readme

## Running

Nothing more complex than a usual executable ruby file:

  $ ruby hw5.rb

Or, as an executable.

  $ chmox +x hw5.rb
  $ ./hw5.rb

## Table of results

=== Part 4 ===
members .01 bf error rate: 95.0%
members .001 bf error rate: 87.14%
members .0001 bf error rate: 72.96000000000001%
non members .01 bf error rate: 0.0%
non members .001 bf error rate: 0.0%
non members .0001 bf error rate: 29.669999999999995%

=== Part 5 ===
members .01 bf error rate: 95.0%
members .001 bf error rate: 87.14%
members .0001 bf error rate: 60.41%
non members .01 bf error rate: 9.999999999999998%
non members .001 bf error rate: 0.0%
non members .0001 bf error rate: 42.21%

## How does my data match up?

Uhh, not really that great honestly. My hash function generation isn't very good. That's
the main thing I'd like to focus on in further improvements. The BloomFilter should be a
lot lower than what it is now. It also varies between runs because of the minor randomness,
which isn't very good. So that's clearly the main thing to focus on.

## Efficiency of Algorithm.

I'd say that it's O(1) time for inserts. This is because it maps over the constant number of
hash functions `k` never changes between inserts, so it's pulled out as a constant for the
hashing call. (Due to the properties of summation.) Then I found (what I think is) a shortcut
that allows us to take those values and reduce over them performing a binary or and passing
that as the accumulator to the next iteration (for another constant time operation) to get the
binary string to mask against the existing bits.

For contains operations it's a very similar operation. The first two steps of inserts are the same.
(Hashing the input over all hash functions, and then reduction shortcut) However, then I seem to have found another minor shortcut. Considering both arrays of bits, if you reverse them both and zip them together you'll end up with a "least significant bit" to "most siginificant bit" of which ever
array is smaller. This works because if we notice that the input is larger than the storage then
we know we can't have that element contained, and if it's smaller then we don't have to search the entire space of what we've stored. It's a minor improvement, but a nice fallout none the less.
