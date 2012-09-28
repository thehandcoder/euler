digits = 999999
@numbers = []
#puts (1..digits).step(3)inject() { |sum, x| sum += digits * x-1/x }

max = 999999
@primes = (2..max).to_a
@composits = []
@compfactors = []
@primes.each {| i | 
  if (i)
    (i*2..max).step(i) { | x | 
        
        @compfactors[x] ||= []
        @compfactors[x] << i
        if @primes[x-2]
          @composits << x
          @primes[x-2] = nil
        end
      }
  end}
@primes2 = @primes.compact
#@composits.each do |cp|
#  puts "cp: #{cp}"
#  puts "factors: #{@compfactors[cp].join(',')}"
#end

@total = 0
@composits.each() { |cp| 
  #puts @primes.slice(0, cp-2).compact.join(",")
  #puts @compfactors[cp].join(",")
  #puts cp
  #walk backwards from the end to find the actual point
  #id = (cp/2)
  #while id < @primes2.length && @primes2[id] >= cp do
  #   id -= 1 
  #end
  @primes2.slice(0, cp).compact.length
  #puts @primes.slice(0, cp-2).compact
  #@total += @primes.slice(0, cp-2).compact.length - @compfactors[cp].length + 1
}

#@primes.compact.each { |p| 
# next unless p
# @total += p-1
#}

#puts @total