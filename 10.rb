# Problem 10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
# Answer: 142913828922

max = 2000000
ints = (2..max).to_a
 (2..max).each do | i | 
  (i**2..max).step(i) do | x | 
    ints[x-2] = nil if x
  end
end
puts ints.compact!.reduce(:+)