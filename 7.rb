# Problem 7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?
# Answer: 104743
#
# This is kind of dirty, I find all the primes in a big range then I just grab number 10001
#
max = 1000000
ints = (2..max).to_a
 (2..max).each do | i | 
  (i**2..max).step(i) do | x | 
    ints[x-2] = nil if x
  end
end
ints.compact!
puts ints[10000]
