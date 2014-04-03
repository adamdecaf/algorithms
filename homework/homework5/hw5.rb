#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# Part 1
# Implement a simple hash function factory. Given an argument m, the desired hash table size, the
# factory should return a hash function that maps integers into a table of that length.
# You can do this in one of two ways:
# * Do a little research to create a generator that is capable of creating any number of hash
#   functions, as needed.
# * Create by hand five functions templates that you can use specialize with the table size.
#   This will
#   pace an upper limit of five on the number of hash functions that your factory can produce
#   for any given table size.

NUMBER_OF_HASH_FUNCTIONS = 7

# Okay so, just mod the number and then put it into it's own
# separate subset of the integers (offsetted by the mod).
class HashFunction
  def initialize(n, offset)
    @n = n
    @offset = offset
  end

  def hash(v)
    (v % @n) * @offset
  end
end

# Just make a hash function that picks a subset of the ints
# and puts all outputs there.
def random_int(scalar = 1000)
  r = Random.new
  res = (r.rand() * scalar).to_i
  res
end

def make_hash_function(m)
  offset = random_int()
  HashFunction.new(m, (offset << m))
end

## Trials
# hf = make_hash_function(1000)
# puts "#{hf.hash(100)}"
# puts "#{hf.hash(100)}"
# puts "#{hf.hash(10000)}"
# puts "#{hf.hash(24284174)}"
# puts "#{hf.hash(76123762)}"

# Part 2
# Implement a Bloom filter as a class, package, or abstract data type.
#  * A Bloom filter's primary constructor receives two arguments: the desired false positive
#    rate, c, and the expected number of keys to store, n. This constructor should use the
#    formulas from Session 19 to select an appropriate bit vector size, m, and number of
#    hash functions, k.
# * A second constructor receives those two arguments plus the size of the bit vector to use, m.
#   This constructor should use the formulas from Session 19 to select an appropriate number
#   of hash functions, k.
# In both cases, if your hash function factory has a limit of five from above, then you will
# limit k to five.
# In the primary constructor, adjust m according to the formula. In the secondary, use the m
# requested.

# k - # of hash functions
# c - false positive rate
# n - # of keys to store
# m - size of bit vector to use

class BloomFilterFactory
  def self.make_filter(false_pos_rate, number_of_keys, bit_vect_size_scalar = nil)
    bit_vect_size = ((-number_of_keys * Math.log(false_pos_rate)) / (Math.log(2) ** 2)).to_i
    if bit_vect_size_scalar == nil
      num_of_hashes = (bit_vect_size / number_of_keys) * Math.log(2)
      BloomFilter.new({ :bit_vect_size => bit_vect_size, :num_of_hashes => num_of_hashes })
    else
      num_of_hashes = Math.log(2) * (bit_vect_size / number_of_keys)
      BloomFilter.new({ :bit_vect_size => (bit_vect_size * bit_vect_size_scalar),
                        :num_of_hashes => num_of_hashes })
    end
  end
end

class BloomFilter
  def initialize(options)
    @options = {
      :bit_vect_size => 1,
      :num_of_hashes => NUMBER_OF_HASH_FUNCTIONS
    }.merge(options)

    @bit_vec = 0
    @hash_functions = (1..@options[:num_of_hashes]).to_a.map { |o| make_hash_function(o) }
  end

  def insert(v)
    results = hash_results(v) # note, these are still ints.

    ## Now that we've hashed the value over the hash functions,
    ## we just need to or mask it against the existing @bit_vec
    ## class variable and store it back in itself.
    # puts "#{results}"
    or_masked_results = results.reduce { |acc, res| acc | res }

    # puts "@bit_vec before: #{@bit_vec}"
    @bit_vec = @bit_vec | or_masked_results
    # puts "@bit_vec after: #{@bit_vec}"
  end

  def contains?(v)
    results = hash_results(v)
    or_masked_results = results.reduce { |acc, res| acc | res }
    zipped_bits = to_bin_arr(or_masked_results).reverse.zip(to_bin_arr(@bit_vec).reverse)
    zipped_bits.all? { |input, bitz| input == bitz }
  end

  def count()
  end

  private
  def hash_results(v, fns = @hash_functions)
    fns.map { |h| h.hash(v) }
  end

  def to_bin_arr(i)
    i.to_s(2).split('').map{ |b| b.to_i }
  end
end

bf1 = BloomFilterFactory.make_filter(0.001, 1000)
bf2 = BloomFilterFactory.make_filter(0.001, 1000, 40)

# puts "inserting 10: #{bf1.insert(10)}"
# puts "inserting 12414: #{bf1.insert(12414)}"
# puts "inserting 2481428: #{bf1.insert(2481428)}"

# this isn't always correct..
# puts "is 10 contained?: #{bf1.contains?(10)}"
# puts "is 10 contained?: #{bf1.contains?(10)}"
# puts "is 100 contained?: #{bf1.contains?(100)}"

# Part 3
# Generate two sets of data for testing your Bloom filter:
# * a membership set: a list of 10,000 unique integers selected randomly from the range
#  [10000..99999]
# * a test set: a list of 10,000 unique integers not in the membership set, also selected
#   randomly from the range [10000..99999]

def generate_random_ints(min = 10000, count = 10000, offset = 10, step = 1)
  rng = Random.new
  (1..count).to_a.map { |v| (v * (min >> offset)).to_i + min - step }
end

def all_numbers_between_ranges(arr = nil, min = 10000, max = 99999)
  def check(arr, min, max)
    arr.all?{ |v| (v >= min) and (v <= max) }
  end

  if arr == nil
    check(generate_random_ints(), min, max)
  else
    check(arr, min, max)
  end
end

def find_error_rate(bf, arr)
  count = arr.inject(0.0) { |score, a|
    if bf.contains?(a)
      score
    else
      score + 1
    end
  }
  count / arr.size
end

def find_inverse_error_rate(bf, arr)
  1 - find_error_rate(bf, arr)
end

# Part 4
# Demonstrate your Bloom filter for each of these false positive rates:
# * 0.01
# * 0.001
# * 0.0001
# In all cases, insert the items in the membership set into a Bloom filter using its primary
# constructor.
# Then look up all the items in the test and compute the false positive rate.

puts "=== Part 4 ==="

## Membership test
members = generate_random_ints()
hf_mem01 = BloomFilterFactory.make_filter(0.01, 10000)
hf_mem001 = BloomFilterFactory.make_filter(0.001, 10000)
hf_mem0001 = BloomFilterFactory.make_filter(0.0001, 10000)
members.each { |m|
  hf_mem01.insert(m)
  hf_mem001.insert(m)
  hf_mem0001.insert(m)
}

puts "members .01 bf error rate: #{find_error_rate(hf_mem01, members)}%"
puts "members .001 bf error rate: #{find_error_rate(hf_mem001, members)}%"
puts "members .0001 bf error rate: #{find_error_rate(hf_mem0001, members)}%"

## Non-membership test
non_members = generate_random_ints().map { |n| n - 1 }
hf_non_mem01 = BloomFilterFactory.make_filter(0.01, 10000)
hf_non_mem001 = BloomFilterFactory.make_filter(0.001, 10000)
hf_non_mem0001 = BloomFilterFactory.make_filter(0.0001, 10000)
non_members.each { |n|
  hf_non_mem01.insert(n)
  hf_non_mem001.insert(n)
  hf_non_mem0001.insert(n)
}

puts "non members .01 bf error rate: #{find_inverse_error_rate(hf_non_mem01, non_members)}%"
puts "non members .001 bf error rate: #{find_inverse_error_rate(hf_non_mem001, non_members)}%"
puts "non members .0001 bf error rate: #{find_inverse_error_rate(hf_non_mem0001, non_members)}%"


# Part 5
# Repeat the process of Task 4 for each of these bit vector sizes:
# * 1.50m
# * 0.75m
# * 0.50m
# where m is the ideal vector size based on n and c.
# Use the Bloom filter's secondary constructor to parameterize the bit vector size.

puts "=== Part 5 ==="

## Membership test
members = generate_random_ints()
hf_mem01 = BloomFilterFactory.make_filter(0.01, 10000, 1.50)
hf_mem001 = BloomFilterFactory.make_filter(0.001, 10000, 0.75)
hf_mem0001 = BloomFilterFactory.make_filter(0.0001, 10000, 0.5)
members.each { |m|
  hf_mem01.insert(m)
  hf_mem001.insert(m)
  hf_mem0001.insert(m)
}

puts "members .01 bf error rate: #{find_error_rate(hf_mem01, members)}%"
puts "members .001 bf error rate: #{find_error_rate(hf_mem001, members)}%"
puts "members .0001 bf error rate: #{find_error_rate(hf_mem0001, members)}%"

## Non-membership test
non_members = generate_random_ints().map { |n| n - 1 }
hf_non_mem01 = BloomFilterFactory.make_filter(0.01, 10000, 1.5)
hf_non_mem001 = BloomFilterFactory.make_filter(0.001, 10000, 0.75)
hf_non_mem0001 = BloomFilterFactory.make_filter(0.0001, 10000, 0.5)
non_members.each { |n|
  hf_non_mem01.insert(n)
  hf_non_mem001.insert(n)
  hf_non_mem0001.insert(n)
}

puts "non members .01 bf error rate: #{find_inverse_error_rate(hf_non_mem01, non_members)}%"
puts "non members .001 bf error rate: #{find_inverse_error_rate(hf_non_mem001, non_members)}%"
puts "non members .0001 bf error rate: #{find_inverse_error_rate(hf_non_mem0001, non_members)}%"


# End
# Create a readme.txt file that presents:
# * anything I need to know to compile and run your program
# * a table summary of the results of your experiments
# * a discussion of how the empirical data match up with the expected values
# * (If they don't match well, suggest possible reasons.)
# * a discussion of the efficiency of your implementation
