=begin
 Write the program "Alphabet letters again yourself"
=end
require 'set'

def get_english_letters_set(str)
    result = Set.new

    str.each_char do |letter|
        if letter >= 'a' and letter <= 'z'
            result.add(letter)
        end
    end
    return result
end

def is_all_english_letters(str)
    return get_english_letters_set(str).size == 26
end

puts is_all_english_letters('some string')
puts is_all_english_letters('quick brown fox jumps over the lazy dog')