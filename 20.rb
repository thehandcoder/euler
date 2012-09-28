# Problem 20
# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!
# Answer: 	648

# This is just brute force, but it will hit it's limit very quickly for 100 it's fine
# there is one a little further along that uses 1,000,000,000,000
puts ((1..100).inject(1) { |prod, x| prod*x}).to_s.chars.inject(0) { | sum, y | sum + y.to_i}