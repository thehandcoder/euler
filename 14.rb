# Problem 14

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.
# Answer: 837799

largest = {"inte" => 0, "numOfSteps" => 0}

#lets cach the math so we don't have to do it everytime
@calcCache = Hash.new

(1..1000000).each do |x|
  @steps = 1
  @n = x
  while @n != 1
    @steps += 1
    @n = @n.even? ? @n/2 : 3*@n + 1
    if @calcCache[@n]
      @steps += @calcCache[@n]
      break
    end
  end
  @calcCache[x] = @steps
  largest = {"inte" => x, "numOfSteps" => @steps}  if @steps > largest["numOfSteps"]
end

puts largest