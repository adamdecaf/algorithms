#!/usr/bin/ruby
# -*- coding: utf-8 -*-

## Problem 1

# Input : Array S[0..n-1] of n characters (the string)
#         Array P[0..m-1] of m characters (the pattern)
# Output: the index of the first character in the string
#         that starts a substring that matches the pattern,
#         or -1 if the search fails
# for i <- 0 to n-m do
#   j <- 0
#   while j < m and P[j] == S[i+j] do
#     j <- j + 1
#     if j == m
#       return i
#  return -1

## How many comparisons, successful and unsuccessful, will this algorithm make in searching a text consisting of 1000 zeroes for each of these patterns?
## 1) 0100
##  n = 00000..0000 (length 1000), m = 0100 (length 4)
##
## Succesful: 2988
## Unsuccessful: 1993
##
## 2) 00001
## Succesful: 8955
## Unsuccessful: 4976
##

def go(s, p)
  successful = 0
  unsuccessful = 0
  n = s.length
  m = p.length
  i = 0
  while i < n - m
    successful += 1
    j = 0
    while j < m and p[j] == s[i+j] do
      successful += 2
      j <- j + 1
      if j == m
        successful += 1
        puts "successful = #{successful}"
        puts "unsuccessful = #{unsuccessful}"
        return i
      else
        unsuccessful += 1
      end
      j += 1
    end
    if !(j < m and p[j] == s[i+j])
      unsuccessful += 1
    end
    i += 1
  end
  if !(i < n - m)
    unsuccessful += 1
  end
  puts "successful = #{successful}"
  puts "unsuccessful = #{unsuccessful}"
  return -1
end

#go(Array.new(1000, 0), [0, 1, 0, 0])
#go(Array.new(1000, 0), [0, 0, 0, 0, 1])

## Problem 2

### Use the partitioning idea seen in binary search to design an algorithm that finds a subrange of an sorted array.
## input:
##  sorted array = A[0..n-1], two integers: lower, upper
## output: the subrange of the array that contains all values v such that lower <= v <= upper. That is:
##  a pair: [indexL, indexU] s.t.
##   (0 <= indexL <= indexU <= n-1) and (lower <= A[indexL] <= A[indexU] <= upper)
## If no such range exists, return -1.

# testing helper
def indexes_satisfy_conditions(arr, lower, upper, indexL, indexU)
  ((0 <= indexL) and (indexL <= indexU) and (indexU <= (arr.length-1))) and
  ((lower <= arr[indexL]) and (arr[indexL] <= arr[indexU]) and (arr[indexU] <= upper))
end

def how_i_would_do_it(a, lower, upper)
  values_with_indexes = a.each_with_index.map { |e, idx| {:index => idx, :value => e} }
  hashes_that_qualify = values_with_indexes.reject{ |h| (h[:value] > upper) or (h[:value] < lower) }
  indexes_that_qualify = hashes_that_qualify.map{ |h| h[:index] }
  [indexes_that_qualify.min, indexes_that_qualify.max]
end

arr = [1,2,3,4,5]
res = how_i_would_do_it(arr, 3, 4)
puts "how_i_would_do_it([1,2,3,4,5], 3, 4) = #{res}"
puts "indexes_satisfy_conditions(#{arr}, lower=3, upper=4, indexL=#{res[0]}, indexU=#{res[1]}) = #{indexes_satisfy_conditions(arr, 3, 4, res[0], res[1])}"

## Problem 3
## Develop a divide-and-conquer algorithm that computes the position of the largest element in an unsorted array of n elements.
## What is the output of your algorithm when several elements in the array are the same largest value? -- return an array of them.

## split the problem down into
def find_largest_indexes(idx_and_value_arr)
  if idx_and_value_arr.size <= 4
    max = [idx_and_value_arr[0]]
    idx_and_value_arr.drop(1).each { |h|
      if h[:value] > max[0][:value]
        max = [h]
      elsif
        max << h
      end
    }
    max
  else
    half = (idx_and_value_arr.size / 2).floor
    l = idx_and_value_arr.take(half)
    r = idx_and_value_arr.drop(half)

    left_max = find_largest_indexes(l)
    right_max = find_largest_indexes(r)

    if left_max.empty?
      return right_max
    end

    if right_max.empty?
      return left_max
    end

    if left_max[0][:value] > right_max[0][:value]
      return left_max
    else
      return right_max
    end
  end
end

def largest_indexes(arr)
  if arr.empty?
    return []
  else
    values_with_indexes = arr.each_with_index.map { |e, idx| {:index => idx, :value => e} }
    half = (values_with_indexes.size / 2).floor

    l = values_with_indexes.take(half)
    r = values_with_indexes.drop(half)

    left = find_largest_indexes(l)
    right = find_largest_indexes(r)

    left + right
  end
end

puts "largest_indexes([1,2,3,4,5,6,7,5,7,5,3,2,7,7,7]) = #{largest_indexes([1,2,3,4,5,6,7,5,7,5,3,2,7,7,7])}"

## Problem 4
