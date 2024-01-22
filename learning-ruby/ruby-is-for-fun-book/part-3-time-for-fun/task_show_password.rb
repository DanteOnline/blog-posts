=begin
Write a method which output starts instead of password.
For example "secret" -> "******"
=end

def hide(text)
    text.length.times do
        print '*' 
    end
end

puts 'Input some text:'
text = gets.chomp
hide(text)