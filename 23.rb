puts Math.sqrt(1001)
def factor(number, start = 1)
  results = []
  (start..number/start).each do | i | 
   if number%i == 0 
     results = [i, number/i]
     if i < number/i
       results += factor(number, i+1)
       break
     end
   end
  end
  results.delete(number)  
  return results.uniq.sort!
end

@abundent = []
@remove = []

max = 28123
(12..max).each do |x|
  if x < factor(x).inject(0) {|sum, y| sum + y}
    @abundent << x
    @abundent.each do |i|
      break if i + x > max
      @remove << i + x
    end
  end
end

@remove.uniq!
puts (1..max).inject(0) {|sum, x| sum + x} - @remove.inject(0) {|sum, x| sum + x}

#puts @abundent