# Problem 5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
# Answer: 232792560

# function to take digit and a list of possible prime numbers
# return and array of all primes factors
def factor(digit, possible)
  @factors = []
  possible.uniq.each do |pf|
    if digit%pf == 0
      @factors.push(pf)
      @r = digit/pf
      possible.include?(@r) ? @factors.push(@r) : @factors += factor(@r, possible).to_a
      break
    end
  end
  
  return @factors
end

# 1 isn't prime so lets not start there
(2...20).each do | i |
    @p ||= [];
    @c ||= [];
    
    # if it's even and not 2 it's not prime
    if i % 2 == 0 and i != 2 
      @c.push(i) 
      next
    end
    
    @x = true;
    # now try all the odd numbers between this number and 1 to see if they get mod 0 if yes then not prime
    (3...i).step(2) {|j| @x = (i%j != 0 and i != j and @x)}
    @x ? @p.push(i) : @c.push(i)
end

# walk through the composites and factor them down to the primes available
@c.each do |c| 
  @factors = factor(c, @p)
  #now look at each factor and see if we have enough of them in our all primes array
  @factors.each {|f| @p.push(f) if @factors.count(f) > @p.count(f) }
end

puts @p.inject(1) {|prod, i| prod *= i }

