# Difference Game

Given a set of two numbers, each player takes turns adding a number to the set
given that the number added is the difference of two other numbers already in
the set. The player who can't move first loses.

## Examples

    1) 6 4
         -> 2
    2) 4 16
         -> 12
             -> 8
    3) 20 21
           -> 1
              -> 19
                  -> ...

## Strategy

* The strategy is related to the gcd.
  * The number of items in the set is `(max(m,n) / gcd(m,n)) - 2`
    * So you can figure out if you want to go first or second.
  * Also, when two numbers are relatively prime then you will set of all numbers between m and n.
