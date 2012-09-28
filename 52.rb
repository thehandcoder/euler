# so the 6 digit has to be greater than 6 * base of the number range
# so in the 10 has to be > 6, 100 > 600, 1000 > 6000 etc
# find all the numbers divisible by 6 then test it for the other

def pe52(startAt, endAt)
  (startAt..endAt).step(6).each do |x|
    bNum = x/6
    bNumCSort = bNum.to_s.chars.sort
    next if bNumCSort != x.to_s.chars.sort
    next if bNumCSort != (bNum*5).to_s.chars.sort
    next if bNumCSort != (bNum*4).to_s.chars.sort
    next if bNumCSort != (bNum*3).to_s.chars.sort
    next if bNumCSort != (bNum*2).to_s.chars.sort
    return bNum
  end
  false
end

(1..10).each do |p|
  if (specNum = pe52((10**p)*6, (10**(p+1)) - 1))
    puts specNum
    break
  end
end
