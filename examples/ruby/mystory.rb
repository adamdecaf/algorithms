#!/usr/bin/ruby

A = ['p', 'i', 'l', 'g', 'r', 'i', 'm']

def mystory(n)
  if n == 1
    puts "#{A}"
  else
    i = 0
    while i <= n
      mystory(n-1)
      if n % 2 == 1
        swap(1, n)
      else
        swap(i, n)
      end
      i += 1
    end
  end
end

def swap(a, b)
  tmp = A[a]
  A[a] = A[b]
  A[b] = tmp
end

puts "mystory(2)"
mystory(2)

puts "\n\nmystory(3)"
mystory(3)

# puts "\n\nmystory(#{A.length})"
# mystory(A.length)
