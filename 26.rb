# Start with a large number.  It's easier than fooling with float 
# precisio and worrying about rounding
# convert the results to a string and start walking the string from left to right
# check the string and see if the next set of digits match if not keep walking
# if no pattern is found, then go to the next string

results = (0..1000).map {|producer| (1..producer).detect() { |x| (10**x % producer) == 1}}
puts results.index(results.compact.max)
