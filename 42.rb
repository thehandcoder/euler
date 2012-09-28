names = File.open("extra/words.txt").read
names = names.split(",").sort().map {|x| x.delete '"'}

@lValues = {
  "A" => 1,
  "B" => 2,
  "C" => 3,
  "D" => 4,
  "E" => 5,
  "F" => 6,
  "G" => 7,
  "H" => 8,
  "I" => 9,
  "J" => 10,
  "K" => 11,
  "L" => 12,
  "M" => 13,
  "N" => 14,
  "O" => 15,
  "P" => 16,
  "Q" => 17,
  "R" => 18,
  "S" => 19,
  "T" => 20,
  "U" => 21,
  "V" => 22,
  "W" => 23,
  "X" => 24,
  "Y" => 25,
  "Z" => 26,
}

# Calculate the value for all the words, finding the highest value
values = names.map {|x| final = x.chars.inject(0) {|sum,c| sum += @lValues[c] }}
tris = [1] + (2..600).to_a.map!{ |n| (n.to_f/2.0)*(n.to_f+1.0) > values.max ? nil : (n.to_f/2.0)*(n.to_f+1.0).to_i}.compact!
values.delete_if {|x| !tris.include?(x)}
puts values.length
