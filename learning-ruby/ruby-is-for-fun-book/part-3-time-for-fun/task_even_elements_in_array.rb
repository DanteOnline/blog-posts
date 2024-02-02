=begin
Use pointer to function to calculate count even elements in array [11, 22, 33, 44, 55]
=end

arr = [11, 22, 33, 44, 55]

count = arr.count(&:even?)
puts count