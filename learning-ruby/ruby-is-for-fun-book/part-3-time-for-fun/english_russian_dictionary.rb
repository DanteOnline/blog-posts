dict = {
    'cat' => 'Кошка',
    'dog' => 'Собака',
    'girl' => 'Девушка'
}

print 'Input the word: '
input = gets.chomp

puts "Перевод слова #{dict[input]}"
