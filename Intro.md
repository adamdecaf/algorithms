# Intro

Question: Given a set of people, find who has the 14th birthday.

Solution: [Quickselect] It allows us to partition the set into two groups based on a pivot
such that we can discard elements that cannot be the answer.

[Quickselect]: http://en.wikipedia.org/wiki/Quickselect

Pseudocode:

```
Given a set of items and an integer n.
While true do:
  if set is of size one, return it's member.
  select a pivot.
  partition the set for all items <= and > than the pivot.
  select the subset that contains the value n.
  repeat.
```
