# Problem 4
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.
# Answer: 906609

def findfactors(start, final)
  results = []
  (start..final/start).each do | i | 
   if final%i == 0 
     results = [i, final/i] if i.to_s.length == 3 && (final/i).to_s.length == 3
     # need to figure out if we should continue
     if i < final/i
       results += findfactors(i+1, final)
       break
     end
   end
  end
  return results.sort!
end


#find the range of numbers to work with
allpal = (100*100..999*999).to_a.reverse.delete_if { | x | x != x.to_s.reverse.to_i}
allpal.each do |p|
  if findfactors(100, p).length >= 2
    puts "#{findfactors(100, p).join('x')} = #{p}"
    break
  end
end
