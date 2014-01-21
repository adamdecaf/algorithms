# Scoring System

Assume there are two teams, `t1`, and `t2`. At the end of each game there are two
scores: `p1:p2`. Games can be played and scored as a function of how many
permutations of scores are possible.

```
games(p1:p2) = n
games(1:0) = 1
games(1:2) = 3
games(2:2) = 6

1) 0:0 -> 1:0 -> 2:0 -> 2:1 -> 2:2
2) 0:0 -> 1:0 -> 1:1 -> 1:2 -> 2:2
3) 0:0 -> 1:0 -> 1:1 -> 2:1 -> 2:2
4) 0:0 -> 0:1 -> 0:2 -> 1:2 -> 2:2
5) 0:0 -> 0:1 -> 1:1 -> 1:2 -> 2:2
6) 0:0 -> 0:1 -> 1:1 -> 2:1 -> 2:2

games(3:2) = 10

games(p1:p2) = 2 + 2^(p1 + p2 - 2)

          1
        1   1
      1   2   1
    1  3    3   1
  1  4    6   4   1
1  5   10   10  5   1
```

## Solutions

Compute a `Top-Down`, `Bottom-Up`, and `Zoom-In` algorithms for the solutions.

## Top-Down

Start with a score, say `6:4` and how can I get to it? Well, there's `6:3` or `5:4`.

```
              6:4
         6;3      5:4
       6:2  5:3 5:3  4:3
      ..  ..  ..  ..  .. ..
  0:0   ...   0:0   ...   0:0
```

So, this would be defined as:

```
               | 1 if p1 == 0 || p2 == 0
games(p1:p2) = | games(p1-1:p2) + games(p1:p2-1) else

```

With time complexity of `O(2^n)` (without optimization) and storage of `O(p1+p2)`.

## Bottom-Up

How can I start at `0:0` and get to `6:4`? Well, start from the bottom.

```
              0:0
          0:1     1:0
        0:2 1:1  1:1  2:0
      ..  ..  ..  ..  ..  ..
              6:4
```

Time Complexity of `O(p1*p2)` and a space complexity of `O(p1*p2)`

## Zoom-In

`n C r` formula. `O(max(p1, p2))` complexity.
