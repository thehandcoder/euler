def d(number)
  factors = factor(number)
  factors.delete(number)
  factors.inject(0) { |x, y| x + y }
end

def factor(number, start = 1)
  results = []
  (start..number/start).each do | i | 
   if number%i == 0 
     results = [i, number/i]
     # need to figure out if we should continue
     if i < number/i
       results += factor(number, i+1)
       break
     end
   end
  end
  return results.sort!
end

@amicable = []
possible = (1..10000).to_a
possible.each do |v|
  if v 
    d1 = d(v)
    if v != d1
      d2 = d(d1)
      if v == d2
        @amicable << v
        @amicable << d1
      end
      possible[v-1] = nil if possible[v-1]
      possible[d1-1] = nil if possible[d1-1]
    end
  end
end

puts @amicable.inject(0) {|sum, i| sum + i}
