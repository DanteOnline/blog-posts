notes = []

loop do
    print 'Please input name and phone number (Put <Enter> for exit)'
    entry = gets.chomp
    break if entry.empty?
    notes << entry
end

puts 'Your notes:'

notes.each do |note|
    puts note
end

