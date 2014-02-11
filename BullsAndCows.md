# Bulls and Cows

Game where k players make a sequence of n digits between a range (typically [0-9]).

## Brute Force

```
for i = 0 to 9 do
  for j = 0 to 9 do
    for k = 0 to 9 do
      // .. repeated n times
      if code = [i,k,k]
        return [i,j,k]
```

## n+1 Guesses

Given `n=3`, we can genreate a matrix like:

```
g_11 * c1 + g_12 * c2 + g_13 * c3 = f1
g_21 * c1 + g_22 * c2 + g_23 * c3 = f2
g_31 * c1 + g_32 * c2 + g_33 * c3 = f3
```

Can turn this into a matrix, or guess the following:

```
1 0 0
0 1 0
0 0 1
```

Which will solve each equation giving you the digit in each spot in the sequence.

Or, if you want to be really fancy:

```
100 0 1
```

Will give you the answer in each position already.

## "1" Guess
