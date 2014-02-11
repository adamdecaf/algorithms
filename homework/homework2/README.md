# Homework #2

Write a few functions that implement different play styles for [The End Game]. They are:

* greedy(board), output is the position of the selected number to pick.
* zoomin(board), output is the position of the selected number to pick.
* random_board(N,Z), N - size of board, Z - max value on board.
* game(P1,P2,board), P1, P2, two players, board is a board game.
  * Output result in this form, from the side of P1, 1.0 for a win, 0.5 for a tie, or 0.0 for a loss.
* experiment(P1,P2,num_trials), output number of games wone by P1 (Should be [0, num_trials])
* reflective_experiments, input n (number of games to be played) as a command line arg, calls experiment() twice
  * once with P1 = greedy() and P2 = zoomin() pick a random board n times (ranges of [2,100]) and output who wins each game.

[The End Game]: http://cs.uni.edu/~wallingf/teaching/cs3530/sessions/session02.html#end-game

Run your program for numbers of games that are powers of 10 from 10 to at least 1,000,000, and put the results in a table.

## Readme

Create a readme.txt file that tells me:

* anything I need to know to compile and run your programs,
* any important design choices you made in writing your program,
* what you found to be the hardest part of the assignment
* your table of results.
