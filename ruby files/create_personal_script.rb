# frozen_string_literal: true

require 'faker'

file = File.open('D:/Scripts_DB/personal_script.sql', 'w')
file.write("INSERT INTO personal (id, last_name, first_name, patronymic, phone, address) values\n")
100999.times do |i|
  file.write("(#{i + 1}, '#{Faker::Name.last_name.gsub("'", "''")}', '#{Faker::Name.first_name}', '#{Faker::Name.suffix}', '#{Faker::PhoneNumber.cell_phone_with_country_code}', '#{Faker::Address.full_address.gsub("'", "''")}'),\n")
end
file.write("(101000, '#{Faker::Name.last_name.gsub("'", "''")}', '#{Faker::Name.first_name}', '#{Faker::Name.suffix}', '#{Faker::PhoneNumber.cell_phone_with_country_code}', '#{Faker::Address.full_address.gsub("'", "''")}');\n")
file.close
