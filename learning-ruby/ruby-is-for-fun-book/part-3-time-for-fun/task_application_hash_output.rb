=begin
Output your hash from "Task Application Hash"
Check that incomming don't show then show_incomming = false 
=end

data = {
    client: 'German Oskarovich Blockchain',
    balance: 123.45,
    transaction_list: [
        {
            desctiption: 'Shoes',
            type: :outcomming,
            value: 40,
        },
        {
            desctiption: 'Salary',
            type: :incomming,
            value: 1000,
        },
    ],
    show_incomming: false,
}

puts data[:client]
puts data[:balance]
transaction_list = data[:transaction_list]
if !data[:show_incomming]
    transaction_list = transaction_list.select do |transaction|
      transaction[:type] != :incomming
    end
end
puts transaction_list


