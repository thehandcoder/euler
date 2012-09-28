def fc(pos)
  stepsLeft = pos
  @count = ""
  while true do
    stepsInIteration = 10 + (@count.to_s.length*10)
    stepsLeft -= stepsInIteration
    @count = @count.to_s.length == 0 ? 1 : @count + 1
    break if stepsInIteration > stepsLeft
  end

  tempstr = (0..9).map { | x | @count.to_s + x.to_s }
  tempstr.join().chars.to_a[stepsLeft].to_i
end

puts 1*fc(10)*fc(100)*fc(1000)*fc(10000)*fc(100000)*fc(1000000)