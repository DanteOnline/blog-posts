=begin
Change the "guess the number program"
1. use numbers from 1 to 1 000 000
2. If user choose wrong number lesser then picked, program should say about it
3. If user choose wrong number bigger then picked, program should say about it
=end

number = rand(1..1000000)
print 'Hello. I pick a number from 1 to 1 000 000. Try to guess it: '

loop do
    input = gets.to_i

    if input == number
        puts 'Right!'
        exit
    else
        if input > number
            puts 'Your number BIGGER then answer'
        else
            puts 'Your number LESSER then answer'
        end
        print 'Try again: '
    end
end