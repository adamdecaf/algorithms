#!/usr/bin/ruby

## Given K sets of points, find the closest pair.
## Eh, this may not be quite right..

## Algo, find distance from 0,0
## sort the list of distances
## linear search to find cloest two pairs.
def find_closest_pair(pairs)
  zz = {:x => 0, :y => 0}
  distances_from_zz = pairs.map { |p| {:distance => distance(p, zz), :point => p} } # O(n)
  cloest_pair = distances_from_zz.sort { |p1, p2|
    dist = abs(p1[:distance] - p2[:distance])
    puts dist
    dist
  }.take(2)
  cloest_pair.map { |p| "#{p[:point][:x]}, #{p[:point][:y]} -- distance: #{p[:distance]}" }
end

def distance(p1, p2)
  Math.sqrt(((p2[:x] - p1[:x]) * (p2[:x] - p1[:x]))  + ((p2[:y] - p1[:y]) * (p2[:y] - p1[:y])))
end

def abs(x)
  if (x < 0)
    -x
  else
    x
  end
end

puts find_closest_pair([{:x => 4, :y => 4}, {:x => 1, :y => 2}, {:x => 2, :y => 2}])

def rand_point()
  {:x => Random.rand(50), :y => Random.rand(50)}
end

lots_of_pairs = Array.new(30).fill { rand_point() }
puts lots_of_pairs
puts find_closest_pair(lots_of_pairs)
