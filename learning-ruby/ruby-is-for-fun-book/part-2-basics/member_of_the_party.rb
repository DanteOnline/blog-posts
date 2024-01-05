puts 'How old ary you?'
age = gets.to_i
puts 'Are you a party member? (y/n)'
answer = gets.chomp.downcase
if age >= 18 and answer == 'y'
    puts 'You are welcome'
end
