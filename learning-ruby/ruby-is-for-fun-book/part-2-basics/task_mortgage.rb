=begin
The house costs 500 000 $.
A person get mortage for 30 years.
Write a program that prints for each year
amount remaining to be paid
=end

amount = 500000
payment_for_year = amount / 30

30.times do |i|
    puts "(#{i+1}) Your remaining amount is #{amount}"
    amount -= payment_for_year
end