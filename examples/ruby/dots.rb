#!/usr/bin/ruby

## 2n inputs
## r4 r2 b2 r3 b4 v1 b3 b1
## return the lengths of connections between ri and bi
## ri is left of bi always

## array of dots, { :color => :red | :blue, :num => 0 }
def find_connection_length(dots)
  found = [] # { :dot => ..., :pos => 0 }
  total_distance = 0
  dots.each_with_index { |dot, idx|
    res = found.find { |f|
      d = f[:dot]
      (d[:color] != dot[:color]) and (d[:num] == dot[:num])
    }
    if res == nil
      found.push({ :dot => dot, :pos => idx })
    else
      found.delete(res)
      total_distance += (idx - res[:pos])
    end
  }
  total_distance
end

def find_connection_length2(dots)
  blue_distance = 0
  red_distance = 0
  dots.each_with_index { |dot, idx|
    if dot[:color] == :red
      red_distance += idx
    else
      blue_distance += idx
    end
  }
  blue_distance - red_distance
end

def find_connection_length2_rec(dots, total = 0, idx = 0)
  if dots == nil or dots.empty?
    total
  else
    dot = dots.first
    update = if dot[:color] == :red
               -1 * idx
             else
               idx
             end
    find_connection_length2_rec(dots.drop(1), total + update, idx + 1)
  end
end

def find_connection_length_delta(dots)
  delta = 0
  total = 0
  dots.each_with_index { |dot, idx|
    if dot[:color] == :red
      delta += 1
    else
      delta -= 1
    end
    total += delta
  }
  raise "delta value of #{delta} is not 0 at the end of elements." unless delta == 0
  total
end

puts "total connection length: "
puts find_connection_length([
                             { :color => :red, :num => 2 },
                             { :color => :blue, :num => 2 },
                             { :color => :red, :num => 1 },
                             { :color => :blue, :num => 1 }
                            ])

puts "total connection length: "
puts find_connection_length([
                             { :color => :red, :num => 2 },
                             { :color => :red, :num => 1 },
                             { :color => :blue, :num => 2 },
                             { :color => :blue, :num => 1 }
                            ])

puts "total connection length: "
puts find_connection_length([
                             { :color => :red, :num => 4 },
                             { :color => :red, :num => 2 },
                             { :color => :blue, :num => 2 },
                             { :color => :red, :num => 3 },
                             { :color => :blue, :num => 4 },
                             { :color => :red, :num => 1 },
                             { :color => :blue, :num => 3 },
                             { :color => :blue, :num => 1 }
                            ])

puts "====="

puts "total connection length2: "
puts find_connection_length2([
                             { :color => :red, :num => 2 },
                             { :color => :blue, :num => 2 },
                             { :color => :red, :num => 1 },
                             { :color => :blue, :num => 1 }
                            ])

puts "total connection length2: "
puts find_connection_length2([
                             { :color => :red, :num => 2 },
                             { :color => :red, :num => 1 },
                             { :color => :blue, :num => 2 },
                             { :color => :blue, :num => 1 }
                            ])

puts "total connection length2: "
puts find_connection_length2([
                             { :color => :red, :num => 4 },
                             { :color => :red, :num => 2 },
                             { :color => :blue, :num => 2 },
                             { :color => :red, :num => 3 },
                             { :color => :blue, :num => 4 },
                             { :color => :red, :num => 1 },
                             { :color => :blue, :num => 3 },
                             { :color => :blue, :num => 1 }
                            ])

puts "====="

puts "total connection length2 rec: "
puts find_connection_length2_rec([
                                  { :color => :red, :num => 4 },
                                  { :color => :red, :num => 2 },
                                  { :color => :blue, :num => 2 },
                                  { :color => :red, :num => 3 },
                                  { :color => :blue, :num => 4 },
                                  { :color => :red, :num => 1 },
                                  { :color => :blue, :num => 3 },
                                  { :color => :blue, :num => 1 }
                                 ])

puts "====="

puts "total connection length delta: "
puts find_connection_length_delta([
                                  { :color => :red, :num => 4 },
                                  { :color => :red, :num => 2 },
                                  { :color => :blue, :num => 2 },
                                  { :color => :red, :num => 3 },
                                  { :color => :blue, :num => 4 },
                                  { :color => :red, :num => 1 },
                                  { :color => :blue, :num => 3 },
                                  { :color => :blue, :num => 1 }
                                 ])
