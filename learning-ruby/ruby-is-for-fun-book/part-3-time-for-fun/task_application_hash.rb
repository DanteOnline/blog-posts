=begin
Write a hash or application (on pictire page 212, online bank interface)
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
    show_incomming: true,
}

puts data.inspect


