@answers = []
(90..99).each { |x| (90..99).each { |y| 
  @answers << (x**y).to_s.chars.to_a.inject(0) { |sum, c| sum + c.to_i }}}
puts @answers.max