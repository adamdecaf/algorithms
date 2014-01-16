# The End Game

The End Game is a game wherein there is an ordered series of numbers such as:
`33 -56 37 2 18 -16 80 48` and the players take turns picking and accumulating
the number they pick. The player with the highest sum when all numbers have been
picked wins.

This game can be fairly easy to try and determine each path in your head for
smaller games, such as sizes of `4` or `5`. However, if you expand the number
of terms to `12`, `20` or even `100` it would become very hard and impossible
to determine each path in your head. (Or even by a programmable algorithm.)

There are many possible algorithms for trying to solve this game. Such as:
`Random`, `Deep Searching` and others. In the game of Go the best programs
to solve games are those in which we find the best result from thousands
of randomly played games.

However, you can also make a decision tree of the possible moves.

```
 -1   3    9    4
    /        \
 3 9 4      -1 3 9
 /  \        /  \
9 4  3 9   3 9   -1 3
| |  | |   | |    | |
9 4  3 9   3 9   -1 3
```

You can fill out similar trees with `Top Down`, `Bottom Up`, or `Dynamic Programming`
approaches. However, utilizing storage space or lookups can be very tricky, as the
search space increases.

Another way to prove that you will win, but not always have the best score possible
would be to sum the even slots and sum the odds. Then pick the one that is higher.
Your opponent will be force to take the other set. However, this only applies to the player going first.
