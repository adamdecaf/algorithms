#!/usr/bin/ruby

## Q(n) - sum of 1..n cubes.

def q(n)
  if n == 1
    return 1
  else q(n-1) + (n*n*n)
  end
end

puts "q(1) = #{q(1)}"
puts "q(10) = #{q(10)}"
puts "q(q(10)) = #{q(q(10))}"
