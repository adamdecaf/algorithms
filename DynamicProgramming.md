## Dynamic Programming

Remembering what you've done before, but from the bottom up.

### Fibonacci Numbers

* Finding the 12th is really easy, just `fib(11) + fib(10)`.
* Now, using a bad procedute to do so is really bad.
* Could use memoization to remember pre-computed solutions.

### Knapsack Problem

* We can solve the Knapsack problem by using brute force, but that's `2^n`.
* Instead, we could solve it in polynomial time [using dynamic programming].

```
                   V[k, W] = S
           /                          \
    Contains Item k             Doesn't contain k
  S = V_k + V[k - 1, W - W_k]      V[k - 1, W] = S
```

Thus,

```
V[i, j] = {
  max(V[i-1, j], v+i + V[i-1, j - w_i]) if j - w >= 0
  V[i - 1, j]                           if j - w_i < 0
}

V[0, j] = 0 if i = o
V[i, 0] = 0 if j = 0
```

[using dynamic programming]: http://en.wikipedia.org/wiki/Knapsack_problem#Dynamic_programming
