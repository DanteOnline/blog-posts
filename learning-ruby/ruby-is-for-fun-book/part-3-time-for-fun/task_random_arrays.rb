=begin
1. Create 5x4 array. Fill this array with random numbers
2. One number in row
3. One nubmer in column
=end

arr = Array.new(4) { Array.new(5) { rand(0..10) } }

print arr
puts

arr = Array.new(4) { Array.new(5, rand(0..10))  }

print arr
puts 

arr = Array.new(4, Array.new(5) { rand(0..10) } )

print arr

