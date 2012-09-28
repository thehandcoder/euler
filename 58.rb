@i = 0
sn = 100000

def isPrime?(number, start = 2)
  (start..Math.sqrt(number)).each { | i | return false if (number != 2 && number.even?) || number%i == 0 }
  true
end

#I stole this.  I implemented myself originally but there were some inefficencies in mine.  I'm going to 
# attempt to reimplement via my code on another problem.
class Integer
   def prime?
     n = self.abs()
     return true if n == 2
     return false if n == 1 || n & 1 == 0
     return false if n > 3 && n % 6 != 1 && n % 6 != 5     # added

     d = n-1
     d >>= 1 while d & 1 == 0
     20.times do                               # 20 = k from above
       a = rand(n-2) + 1
       t = d
       y = ModMath.pow(a,t,n)                  # implemented below
       while t != n-1 && y != 1 && y != n-1
         y = (y * y) % n
         t <<= 1
       end
       return false if y != n-1 && t & 1 == 0
     end
     return true
   end
end
 
module ModMath
   def ModMath.pow(base, power, mod)
     result = 1
     while power > 0
       result = (result * base) % mod if power & 1 == 1
       base = (base * base) % mod
       power >>= 1;
     end
     result
   end
end

@primeCount = 0
@pointCount = 1 # start at 1 cause we start at 3

(3..sn).step(2).each do | base |
  ((base-2)**2 + (base - 1)..(base**2)).step(base - 1).each {
    | point | @i += point
    @primeCount += 1 if point.prime?
    @pointCount += 1
  }
  if @primeCount/@pointCount.to_f < 0.1
    puts "base: #{base}"
    break
  end
end
