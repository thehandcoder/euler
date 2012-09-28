def f(n)
  (1..n).inject(1) { |prod, x| prod * x}
end

grid = 20
puts f(2*grid)/(f(grid)*f(grid))