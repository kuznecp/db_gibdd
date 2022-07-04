# frozen_string_literal: true

require 'faker'

COMPANIES = ['Ugoria', 'Volga', 'Tinkoff', 'Renessans', 'Sovkombank',
             'Rosgosstrah', 'SOGAZ', 'VCK', 'Zetta', 'Soglasie', 'MAKS'].freeze

file = File.open('D:/Scripts_DB/insurance_script.sql', 'w')
file.write("INSERT INTO insurance (id, name, address, phone, email) values\n")
49.times do |i|
  file.write("(#{i + 1}, '#{COMPANIES.sample}', '#{Faker::Address.full_address.gsub("'", "''")}', '#{Faker::PhoneNumber.cell_phone_with_country_code}', '#{Faker::Internet.email}'),\n")
end
file.write("(50, '#{COMPANIES.sample}', '#{Faker::Address.full_address.gsub("'", "''")}', '#{Faker::PhoneNumber.cell_phone_with_country_code}', '#{Faker::Internet.email}');\n")
file.close
