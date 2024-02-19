require 'net/http'

uri =   URI('http://localhost:4567/login')
res = Net::HTTP.post_form(uri, username: 'admin', password: '123456')
puts res.body