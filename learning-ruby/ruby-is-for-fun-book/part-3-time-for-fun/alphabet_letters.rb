require 'set'

def is_all_letters(str)
    set = Set.new

    str.each_char do |char|
        if char >= 'a' && char <= 'z'
            set.add(char)
        end
    end

    set.size == 26
end

puts is_all_letters('quick brown fox jumps over the lazy dog')
puts is_all_letters('brown fox jumps over the lazy dog')

