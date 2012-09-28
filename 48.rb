results = (1...1000).inject(0) { |sum, x| sum + x**x}.to_s
puts results[results.length-10..results.length-1]