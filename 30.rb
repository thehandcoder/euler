fifths = Hash.new
(0..9).each { |x| fifths[x] = x**5}
total = 0
(2..fifths[9]*9).each do | d |
  total += d if d == d.to_s.chars.inject(0) { |sum, i| sum + fifths[i.to_i]}
end
puts total