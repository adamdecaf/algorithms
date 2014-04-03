# Sliding Delta Solutions

The [Sliding Delta Problem](http://cs.uni.edu/~wallingf/teaching/cs3530/sessions/session21.html#sliding-delta-pattern)
is a problem that allows us to have big space savings due to only storing the deltas of effects that we
perform on data as we're trying to compute over it.

## Example

If we want to see who the winner of an election is between two canidates, we could have something like the following:

```
score = 0
for vote in votes
  if vote == "Canidate 1"
    score += 1
  else
    score -= 1
  end
end
if score == 0
  return Tie
else if score > 0
  return "Canidate 1"
else
  return "Canidate 2"
end
```

So we only have to store one variable here, `score`. So the space we're using is `Θ(1)` and the space is `Θ(votes)`.
