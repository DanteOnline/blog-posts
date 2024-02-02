=begin
Write a program for your contacts. It contains name, email, cell_phone, work_phone.
You should get contact information by name
=end

contacts = {
    'Pavel': {
        email: 'pavel@pavel.ru',
        cell_phone: '937293',
        work_phone: '38372',
    },
    'Max': {
        email: 'max@max.com',
        cell_phone: '83273',
        work_phone: '98393',
    }
}

puts 'Input the name: '
name = gets.chomp.to_sym
puts contacts[name].inspect