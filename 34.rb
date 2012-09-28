class BMath
  def factorial(d)
    d = d.to_i
    return 1 if d == 0
    (1..d).inject { |prod, x| prod * x }
  end
end

@m = BMath.new
@answer = 0
(3..100000).each do |x|
  @answer += x if x == x.to_s.chars.inject(0) {|sum, y| sum + @m.factorial(y)}
end
puts @answer