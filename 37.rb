
max = 1000000
@truncs = Array.new
@primes = Array.new
ints = (2..max).to_a

def truncatable?(n, ints, dir = :back) 
  ns = n.to_s
  (1..n.to_s.length-1).each do |c|
    dir == :fore ? ns.reverse!.chop!.reverse! : ns.chop!
    nsi = ns.to_i
    return false unless nsi > 1 && ints[nsi-2]
  end
  true
end

ints.each do | i |
  next unless i
  
  #add to primes
  @primes << i
  
  #remove products
  (i**2..max).step(i) { | x | ints[x-2] = nil } if i

  #look at each charater and see if that character is in the list
  if i > 9
    @truncs << i if truncatable?(i, ints) && truncatable?(i, ints, :fore)
    break if @truncs.length == 11
  end
end

puts @truncs.inject(0) {|sum, x| sum+x}
#start looping from 2 to the top
# number is prime
#   add to prime hash(hash is probably best unless array position can be skipped ints)
#   loop through digits and make sure each sub dumber is in the array