=begin
Read file with passwords and output each string length
=end

f = File.open('passwords.txt')

f.each do |line|
    puts line
    puts line.chomp.length
end