# Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
# Answer: 6857

def findfactors(start, final)
  results = []
  (start..final/start).each do | i | 
   if final%i == 0 
     results = [i, final/i]
     # need to figure out if we should continue
     if i < final/i
       results += findfactors(i+1, final)
       break
     end
   end
  end
  return results.sort!
end

# get all the factors, reduce to prime factors, then get the max
puts findfactors(1, 600851475143).delete_if {|x| findfactors(1, x).length > 2}.max