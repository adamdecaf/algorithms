# Elections

Given a list of `v` votes, and `c` canidates. How can we find a winner (a canidate with a majority of votes)?

## Brute-Force

```
for i <- 1 to c
  c_votes <- 0
  for j <- 1 to v
    if vote[j] == i
      c_votes++
  if c_votes > v/2
    return c
return 0
```

```
for i <- 1 to c
  counts[i] <- 0
for i <- 1 to v
  counts[vote[i]]++
for i <- 1 to c
  if counts[i] > v/2
    return i
return 0
```

## Divide and Conquer

1. Break canidates into K << C ranges.
2. For each range,count the votes for all canidates in the range.
3. If a range has a majority do step 4. Otherwise, return 0
4. Make a second pass with c/K counters.
