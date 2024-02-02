=begin
Create array with 5 elements. 
Get new array:
1. without 2 first elements
2. without 2 last elements
Base array will not be changed
=end

start = [1, 2, 3, 4, 5]
without_first_two = start[2..-1]
puts without_first_two.inspect
puts start.inspect
without_last_two = start[0..-3]
puts without_last_two.inspect
puts start.inspect