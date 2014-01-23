# GCD (Greatest Common Divisor)

There are many possible ways to compute the gcd of two numbers.

## Euclids (Modified) Algorithm

    while n != 0
      r = m mod n
      m = n
      n = r
    return m

### Complexity

* Time: `O(log n)`
* Space: `O(1)`

## (Modified) Linear Search

    t = min(m, n)
    loop
      if m mod t = 0 and
         n mod t = 0
       return t
      t = t - 1

### Complexity

* Time: `O(n)`
* Space: `O(1)`

## Sixth Grade Algrithm

    M = factors(m)
    N = factors(n)
    c = M /\ N
    return product(c)

### Complexity

* Time: `O(log m + )`
* Space: `O(m + n + |M /\ N|)`

## Extra Algorihtms

* Factorization

    O(log m)
    Start at the number and walk down 2,3,5,7,... and find one that divides.

* Common Factors

    O(min(m,n))
    Assuming the lists are sorted, alternate walking down them and progressing
    the pointers when the values are equal (and storing that elsewhere) or
    progressing the pointer whose value is lesser than the next element.

    2 2 3 7 9 11
    2 2 5 9

    -> 2 -> 2 -> 9

    Result <- []
    while lst1 not empty and
          lst2 not empty
      if lst1.head == lst2.head
        Result <- lst1.head
        eliminate them both
      else
        eliminate smaller
