#!/usr/bin/ruby

##
## Homework #2
## By: Adam Shannon
## For: Algorithms
## http://cs.uni.edu/~wallingf/teaching/cs3530/homework/homework02.html
##

class Board
  def self.random_board(num_items, max_value)
    [].fill(0, 0, num_items).map { |_| Random.rand(max_value) }
  end
end

#puts "#{Board.random_board(10, 100)}"

class GreedyPlayer
  def make_move(choices)
    #[choices.first, choices.last].max
    if choices.first > choices.last
      0
    else
      choices.length - 1
    end
  end
end

greedy = GreedyPlayer.new
# puts "One Round w/ Greedy: #{greedy.make_move([3,5,7,1])}"

class ZoominPlayer
  def make_move(choices)
    evens = choices.select.each_with_index { |_,i| i.even? }
    odds = choices.select.each_with_index { |_,i| i.odd? }

    even_sum = evens.inject(:+)
    odd_sum = odds.inject(:+)

    if choices.length == 1
      0
    else
      if even_sum > odd_sum
        0
      else
        1
      end
    end
  end
end

zoomin = ZoominPlayer.new
# puts "One Round w/ Zoomin: #{zoomin.make_move([3,5,7,1])}"

class Game
  def experiment(p1, p2, num_trials)
    run_experiment(p1, p2, num_trials, 0)
  end

  def game(p1, p2, board)
    play_game(p1, p2, board, 0, 0)
  end

  private
  def play_game(p1, p2, board, p1_score, p2_score)
    if board.empty?
      if p1_score > p2_score
        1.0
      elsif p1_score == p2_score
        0.5
      else
        0
      end
    else
      p1_move = p1.make_move(board)
      board = remove_from_edge(board, p1_move)

      p2_move = p2.make_move(board)
      board = remove_from_edge(board, p2_move)

      play_game(p1, p2, board, p1_score + p1_move, p2_score + p2_move)
    end
  end

  def run_experiment(p1, p2, num_trials, p1_wins)
    if num_trials <= 0
      p1_wins
    else
      game = Game.new
      result = game.game(p1, p2, Board.random_board(4, 100))
      if (1.0 - result) <= 0.01
        run_experiment(p1, p2, num_trials - 1, p1_wins + 1)
      else
        run_experiment(p1, p2, num_trials - 1, p1_wins)
      end
    end
  end

  def remove_from_edge(board, move)
    if board.first == move
      board.drop(1)
    else
      board[0..-2]
    end
  end
end

def driver()
  game = Game.new

  greedy = GreedyPlayer.new
  zoomin = ZoominPlayer.new

  num_trials = ARGV[0].to_i
  puts "p1 as greedy #{game.experiment(greedy, zoomin, num_trials)}"
  puts "p1 as zoomin #{game.experiment(zoomin, greedy, num_trials)}"
end

game = Game.new
puts "Play a game: #{game.game(greedy, zoomin, Board.random_board(4, 100))}"
puts "Playing 5 games, p1 won: #{game.experiment(greedy, zoomin, 5)} time(s)."
puts "Running 2 experiments: "
driver()
