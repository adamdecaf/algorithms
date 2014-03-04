## Decrease and Conquer

Related to Divide and Conquer, Decrease and Conquer is an algorithm strategy that works to
take off a constant number of items away from a problem. Aka, to decrease a problem by a
fixed problem size to get to points where the smaller problems can be solved and merged
back together.

Consider:

```
a = a1 a0
b = b1 b0

c = a * b = c2 c1 c0

c2 = a1 * b1
c1 = (a1 + a0) * (b1 + b0) - (c0 - c2)
c0 = a0 * b0
```
