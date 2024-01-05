=begin
Write a program for salary calculation for a year.
User input salary amout by month. The program output saray amout by year.
Each user want to save 15% of salary. Add feature to output saved amout by year.
Add feature to output saved amout by 5 years.
=end

puts 'Please input your salary by month'
salary_by_month = gets.to_i
salary_by_year = salary_by_month*12
puts "Your salary by year = #{salary_by_year}"
saved_amount = salary_by_year*15/100
puts "If you will save 15% you will have #{saved_amount} by year"
puts "If you will save 15% you will have #{saved_amount*5} by 5 years"