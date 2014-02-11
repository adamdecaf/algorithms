#!/usr/bin/ruby

class Rock
  def initialize(weight)
    @weight = weight
  end

  def weight
    @weight
  end
end

def find_best_rock(rocks)
  if (rocks.length - 1 == 0)
    rocks.first
  else
    half_len = (rocks.length / 2).floor
    left = rocks.take(half_len)
    right = rocks.drop(half_len)

    left_sum = sum_rocks(left)
    right_sum = sum_rocks(right)

    if (left_sum > right_sum)
      find_best_rock(left)
    else
      find_best_rock(right)
    end
  end
end

def sum_rocks(rocks)
  rocks.inject(0) { |acc, r| acc + r.weight }
end

puts "Find best rock with a weight of: #{find_best_rock([Rock.new(1), Rock.new(1), Rock.new(2), Rock.new(1)]).weight}"
