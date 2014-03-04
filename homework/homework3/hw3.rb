#!/usr/bin/ruby
# -*- coding: utf-8 -*-

##
## Adam Shannon
## CS 3530
## Homework #3
##

## http://cs.uni.edu/~wallingf/teaching/cs3530/sessions/session11.html#greedy-board-coloring
# for row = 1 to n do
#        for col = 1 to n do
#            if row_input[row] > 0 and col_input[col] > 0
#               put token at board[row][col]
#               row_input[row] -= 1
#               col_input[col] -= 1
#    return (all values in both input lists are 0s)
def greedy(rows, cols)
  board = Array.new(rows.length) { Array.new(cols.length) }
  rows.each_with_index { |r, r_idx|
    cols.each_with_index { |c, c_idx|
      board[r_idx][c_idx] = if (r > 0 and c > 0)
                              rows[r_idx] -= 1
                              cols[c_idx] -= 1
                              'x'
                            else
                              'o'
                            end
    }
  }
  board
end

puts "#{greedy([1,1,2], [1,2,1])}"

## http://cs.uni.edu/~wallingf/teaching/cs3530/sessions/session11.html#zoomin-board-coloring
def zoomin(rows, cols)
end

## Generate two lists that satisfy the following
### All list members are integers in the range [0..N].
### The sum of the two lists must be identical.
### The sum must be in the range [N²/4 .. 2N²/3].
def random_board_config(side_len)
end
