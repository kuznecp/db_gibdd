# frozen_string_literal: true

require 'faker'

file = File.open('D:/Scripts_DB/gibdd_script.sql', 'w')
file.write("INSERT INTO gibdd (id, address, phone, email, duty) values\n")
499.times do |i|
  file.write("(#{i + 1}, '#{Faker::Address.full_address.gsub("'", "''")}', '#{Faker::PhoneNumber.cell_phone_with_country_code}', '#{Faker::Internet.email}', '#{Faker::Name.last_name.gsub("'", "''")}'),\n")
end

file.write("(500, '#{Faker::Address.full_address.gsub("'", "''")}', '#{Faker::PhoneNumber.cell_phone_with_country_code}', '#{Faker::Internet.email}', '#{Faker::Name.last_name.gsub("'", "''")}');\n")

file.close
