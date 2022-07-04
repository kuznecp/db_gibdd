# frozen_string_literal: true
# done
require 'faker'

MANUFACTURES = ['Opel', 'Toyota', 'BMW', 'Peugeot', 'Mercedes',
                'MacLaren', 'Audi', 'Lada', 'Honda', 'Ford', 'Nissan',
                'Hyundai', 'Chevrolet', 'Kia', 'Suzuki', 'Renault'].freeze

BOOLS = %w[TRUE FALSE].freeze

file = File.open('D:/Scripts_DB/manufacturers_script.sql', 'w')
file.write("INSERT INTO manufacturers (id, name, address, number_of_defective) values\n")
299.times do |i|
  file.write("(#{i + 1}, '#{MANUFACTURES.sample}', '#{Faker::Address.full_address.gsub("'", "''")}', #{rand(1..100_000)}),\n")
end
file.write("(300, '#{MANUFACTURES.sample}', '#{Faker::Address.full_address.gsub("'", "''")}', #{rand(1..100_000)});\n")
file.close
