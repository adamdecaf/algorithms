#!/usr/bin/ruby
# -*- coding: utf-8 -*-

## Adam Shannon
## Algorithms
## 2014-01-29
## For: Dr. Wallingford

## === Problem 1 ===

## Find common elements between two lists.
## Assume they're sorted.
def find_common_elements(lst1, lst2, common = [])
  if (!lst1.empty? && !lst2.empty?)
    a = lst1[0]
    b = lst2[0]

    if a == b
      find_common_elements(lst1.drop(1), lst2.drop(1), common.push(a))
    else
      if a < b
        find_common_elements(lst1.drop(1), lst2, common)
      else
        find_common_elements(lst1, lst2.drop(1), common)
      end
    end
  else
    common
  end
end

puts "\nProblem 1:"
puts "Common elements between [1,2,3] and [1,3,5,6] = #{find_common_elements([1,2,3], [1,3,5,6])}"

## This will output [1,3] as expected.

## This algorithm is top-down because it runs through the lists at most two elements at a time
## (when there is a match) and only one slot when there is no match. So, it's breaking the problem
## down into a smaller problem, solving that, and moving down the list.

## This algorithm performs in O(min(m,n)) time. Aka linear time based on the smaller list.
## This is the worst case because the entire smaller list will always be processed.
## Also, if the elements being compared match then there is only one compare operation
## (aside from the .empty? calls), which always happen. If the elements don't match then there is
## a second compare to see which list to reduce upon.


## === Problem 2 ===

# // Input : Array A[0..n-1] of orderable values
# // Output: Array S[0..n-1] of A's elements, sorted in nondecreasing order
#     for i ← 0 to n-1 do
#         Count[i] ← 0
#     for i ← 0 to n-2 do
#         for j ← i+1 to n-1 do
#             if A[i] < A[j]
#                then Count[j] ← Count[j] + 1
#                else Count[i] ← Count[i] + 1
#     for i ← 0 to n-1 do
#         S[Count[i]] ← A[i]
#     return S


## * Demonstrate how this algorithm operates on this input array: [93, 13, 37, 14].

## It first builds up an array, Count[] which has the following values.
## Count[93] == 0
## Count[13] == 0
## Count[37] == 0
## Count[14] == 0

## Then, it cycles through all but the last element in a for loop, which triggers another for loop
## over the current index+1 to the end of the array. (So the elements to the right of the current element)
## Then, if the two items are less then it will increment the Count[]'s for the value that's greater than.
## Count would look like this after
## Count[93] = 3
## Count[13] = 0
## Count[37] = 2
## Count[14] = 1

## Lastly, it will iterate through the entire Count[] array and fill the output array with the original
## value at the index of the Count[] for that value.

## And, this algorithm implemented literally in ruby with debugging commented out.

def comparison_counting_sort(lst)
  n = lst.length
  count = []

  i = 0
  while i <= n - 1 do
    count[i] = 0
    i += 1
  end

  #print_count_array(lst, count, "create count[] array")

  i = 0
  while i <= n - 2 do
    j = i + 1
    while j <= n - 1 do
      if lst[i] < lst[j]
        count[j] = count[j] + 1
      else
        count[i] = count[i] + 1
      end
      j += 1
    end
    i += 1
  end

  #print_count_array(lst, count, "scores are added up.")

  output = []
  i = 0
  while i <= n - 1 do
    output[count[i]] = lst[i]
    i += 1
  end

  output
end

def print_count_array(lst, count, desc)
  puts "#{desc}"
  lst.each_with_index { |v, i| puts "Count[#{v}] = #{count[i]}" }
  puts "\n"
end

puts "\nProblem 2:"
puts "Comparison Counting Sort output on: [93, 13, 37, 14], #{comparison_counting_sort([93, 13, 37, 14])}"

## * Explain why this algorithm is (or isn't) stable.
## This algorithm is stable, because the output is in non-decreasing order. (ascending order)

## * Explain why this algorithm is (or isn't) in-place.
## This algorithm is not in-place, because it makes a new array, S, which holds and is populated with the
## resulting array which is returned.


## === Problem 3 ===

## 3. Read the first two paragraphs of the section labeled What is a patent? on US Patent and Trademark Office's patents web page.
## Should the inventor of an algorithm be eligible to receive a utility patent? Why, or why not? (Limit yourself to three to five sentences.)

## "Utility patents may be granted to anyone who invents or discovers any new and useful process,
## machine, article of manufacture, or composition of matter, or any new and useful improvement
## thereof.

## -- Response --

## Well, this is a touchy subject in the field of computer science. Largely so because many of our
## fundamental building blocks are often times patented. Does this mean that we can't use the most
## basic aspects of computer science? Math isn't patentable, and computer science was born out of
## mathematics. To me, no, algorithms should not be patentable.
