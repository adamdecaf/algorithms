## Graph Coloring

Recall the check game: Given input like:

```
1 1 3 <- row counts
3 1 1 <- col counts
```

Generate a board that statisfies the counts of number of checks in each row and col.
We can solve this by applying the following strategy.

* At each point:
  * each column value <= the number of rows yet to be colored
  * each row value <= the number of cols yet to be colored

## Lease Committment Strategy

Pick the column that has the largest number available. Then you can work down the
problem to a point where you can be confident that the solution is either completed,
or doesn'texist.
