require "OpenSSL"
data = gets().chomp

puts "Cifrando..." , data
cipher = OpenSSL::Cipher::AES.new(128, :CBC)
cipher.encrypt
key = "1234567890123456"
iv = "6543210987654321"

cipher.key = key
cipher.iv = iv

encrypted = cipher.update(data) + cipher.final

puts "Descifrando...", encrypted

decipher = OpenSSL::Cipher::AES.new(128, :CBC)
decipher.decrypt
decipher.key = key
decipher.iv = iv

plain = decipher.update(encrypted) + decipher.final


puts data == plain
print data,"=",plain
puts


