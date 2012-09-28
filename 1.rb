# Problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
# Anser: 233168

puts (0..999).inject(0) {|sum, n| n%5 == 0 || n%3 == 0 ? sum + n : sum }


