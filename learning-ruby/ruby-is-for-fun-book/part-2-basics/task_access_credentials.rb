# Grant access if login and password == admin

puts 'Login:'
login = gets.chomp
puts 'Password:'
password = gets.chomp
puts 'Access Granted' if login == 'admin' and password == 'admin'