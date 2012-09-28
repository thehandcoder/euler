#so lets find the permutations
perms = [0,1,2,3,4,5,6,7,8,9]
permsLeft = 1000000
fout = []

(0..perms.length).each() do | p |
  factors = perms.slice(p..perms.length - 1)
  permCount = (1..factors.length).inject(1) { |prod, x| prod * x}
  while permCount < permsLeft
    factSmall = factors.min
    factors << fout.last
    
    #Get the smallest number greater than the current number
    fout[fout.length-1] = factors.sort.find {|ov| ov > fout[fout.length-1]}
    factors.delete(fout.last)
    permsLeft -= permCount
  end
  
  # Rework the perm array so we don't get overlap
  perms = fout + factors.sort
  fout << factors.sort.first
end
puts "final: #{fout}"
