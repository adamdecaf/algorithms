#!/usr/bin/ruby

## In Class pseudocode
=begin
for all combinations of occupied/empty squares
  if board satisfies input
    return true
return false
=end

## In Class Greedy Pseudocode
=begin
for row = 1 to n do
  for col = 1 to n do
    if row_inputp[row] > 0 and col_input[col] > 0
      put token @ board[row][col]
      row_input[row] -= 1
      col_input[col] -= 1
check to see row_input, col_input == 0
=end

def solve_check_game(row_input, col_input, row = 0, col = 0, board = [], row_acc = [])
  raise "Row and Column sizes are not the same!" unless row_input.size == col_input.size
  if col_input != 0
    needs_check = row_input[row].to_i > 0 and col_input[col].to_i > 0
    if needs_check
      solve_check_game(row_input.drop(1), col_input.drop(1), row, col + 1, board, row_acc.push("x"))
    else
      solve_check_game(row_input.drop(1), col_input.drop(1), row, col + 1, board, row_acc.push("o"))
    end
  end
  puts "Board: #{board.push(row_acc)}"
end

## running
solve_check_game([1,1,2], [1,2,1])
