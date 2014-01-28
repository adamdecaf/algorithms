# Factor Game

Given a range of integers [n,m], take turns with a partner adding a new 
number which is either a factor or a multiple (within the bounded range) 
based on the previous number.

## Questions

* Is there a list of size 89?
  * If so, do we have to start with a particular number?
  * If not, is there a unique set of end points?

## Strategies 

* If the number is less than `|[n,m]|` make the next into a multiple.
  * If the number greater than or equal to `|[n,m]|` factor it.
* Create a graph of the possible paths from each number.
* Multiple numbers repeatidly until you would go out of the range, then factor..

