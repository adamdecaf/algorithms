#!/usr/bin/ruby

## Given an ordered array of miles apart, and a constant amount of gas
## added at each stop. Where can we start and come back to the starting
## point after visiting all stations.

## E.g. [12, 6, 14, 8]

GAS_ADDED_PER_STOP = 10

def attempt(stations)
  attempt_cycle(stations, stations.first, stations.first)
end

def attempt_cycle(stations, starting_station, tank_capacity)
  if (tank_capacity <= 0 || stations.empty?)
    return starting_station
  else
    attempt_cycle(stations.drop(1), starting_station, GAS_ADDED_PER_STOP + stations.first - tank_capacity)
  end
end

puts "Can we get around [12,6,14,8] == #{attempt([12,6,14,8])}"
puts "Can we get around [14,8,12,6] == #{attempt([14,8,12,6])}"
