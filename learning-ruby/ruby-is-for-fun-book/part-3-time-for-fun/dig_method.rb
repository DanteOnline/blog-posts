users = [
    {
        first: 'John',
        last: 'Smith',
        address: {
            city: 'San Francisco',
            country: 'US',
            street: {
                line1: '555 Market Street',
                line2: 'apt 123'
            }
        }
    },
    { first: 'Pat', last: 'Roberts', address: { country: 'US' } },
    { first: 'Sam', last: 'Schwartzman' }
]

users.each do |user|
    puts user.dig(:address, :street, :line1)
end