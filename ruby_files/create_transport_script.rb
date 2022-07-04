# frozen_string_literal: true

require 'faker'

TYPES = ['Sedan', 'Roadster', 'Cupe', 'Universal', 'Minivan', 'hatchback',
         'Cabriolet', 'Limousine', 'Truck'].freeze

WEIGHTS = [100000, 200000, 250000, 300000, 500000, 550000, 700000].freeze
PRICES = [1000000, 2000000, 3000000, 4000000, 5000000, 4500000, 3500000, 2500000, 1500000].freeze

file = File.open('D:/Scripts_DB/transport_script.sql', 'w')
file.write("INSERT INTO transport (id, id_department, id_brand, technical_passport, type,
                    year_of_release, weight, engine_capacity, color, price) values\n")
99_999.times do |i|
  file.write("(#{i + 1}, #{rand(1..500)}, #{rand(1..300)}, #{i + 13671 + rand(1..100)}, '#{TYPES.sample}',
   #{rand(2000..2022)}, #{WEIGHTS.sample}, #{rand(1..5)}, '#{Faker::Color.color_name}', #{PRICES.sample}),\n")
end
file.write("(100000, #{rand(1..500)}, #{rand(1..300)}, #{100000 + 13671 + rand(1..100)}, '#{TYPES.sample}',
   #{rand(2000..2022)}, #{WEIGHTS.sample}, #{rand(1..5)}, '#{Faker::Color.color_name}', #{PRICES.sample});\n")
file.close
