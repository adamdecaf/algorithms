## Divide and Conquer

1. __Divide__ Problem into 2 or more subproblems.
2. __Conquer__ subproblems:
   1. Do the same procedute to each
   2. Apply some other algorithm when small enough.
3. __Assemble__ solutions to subproblems to create solution to original problem.

### Complexity

```
T(n) = aT(n/b) + f(n)
```
Where,

* `T`: total problem space.
* `a`: Number of subproblems.
* `f(n)`: Merge compexity.

### Master Relation

```
if f(n) < Θ(n^d) for d >= 0
  if a < b^d then T(n) is a member of Θ(n^d)
  if a = b^d then T(n) is a member of Θ(n^d log(n))
  if a > b^d then T(n) is a member of Θ(log_b(a))
```
