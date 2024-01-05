=begin
Users want to buy a land on the moon. User input land size and program output land cost
land lesser then 50 cost 1000
land between 50 and 100 cost 1500
more then 100 - 25 dollars for 1 square meter
=end

puts 'Input land size (square meters)'
size = gets.to_i
cost = 1000
if size > 50 and size < 100
    cost = 1500
end
if size >= 100
    cost = size*25
end

puts "Cost: #{cost}"