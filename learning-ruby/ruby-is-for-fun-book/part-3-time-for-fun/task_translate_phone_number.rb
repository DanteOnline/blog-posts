=begin
You should translate phone number with simbols to phone number with numbers.
2 - abc
3 - def
4 - ghi
5 - jkl
6 - mno
7 - pqrs
8 - tuv
9 - wxyz

For example "555matress" => "5556287377"
=end

numbers = [
    nil, nil, 'abc', 'def', 'ghi', 'jkl', 'mno', 'pqrs', 'tuv', 'wxyz'
]

phone = "555matress"

# new_phone = []

phone.chars do |number|
    is_changed = false
    2.upto(numbers.size-1) do |index| 
        simbols = numbers[index]
        simbols.chars do |char|
            if char == number
                new_char = index
                # new_phone << new_char
                print new_char
                is_changed = true
            end
        end
    end

    if !is_changed
        #new_phone << number
        print number
    end
end 
puts
