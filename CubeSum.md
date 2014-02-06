# Analyzing a Recursive Cube Sum

Given some algorithm like:

```
if n = 1
  then return 1
  else reutrn Q(n-1) + (n * n * n)
```

First, setup a recurrence relation

```
M(1) = 0
M(n) = M(n-1) + 2
```

However, we can start to substitute previous values for M into the equation
until we see a pattern for `n = i`

```
M(1)                    = 1
M(n) =                    M(n-1) + 2
     = (M(n-2) + 2) + 2 = M(n-2) + 4
     = (M(n-3) + 2) + 4 = M(n-3) + 6
     ...                = M(n-i) + 2i
```
