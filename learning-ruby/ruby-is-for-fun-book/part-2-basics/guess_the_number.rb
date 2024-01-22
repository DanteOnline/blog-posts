number = rand(1..10)
print 'Hello. I pick a number from 1 to 10. Try to guess it: '

loop do
    input = gets.to_i

    if input == number
        puts 'Right!'
        exit
    else
        print 'Wrong, try it again: '
    end
end
