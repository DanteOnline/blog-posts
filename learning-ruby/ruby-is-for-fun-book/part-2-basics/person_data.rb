puts 'Your name?'
name = gets.chomp

puts 'Your age'
age = gets.to_i

puts 'Your city'
city = gets

puts '=' * 80
puts "You are #{name}, your age in months is #{age * 12}, and you are from #{city}"
