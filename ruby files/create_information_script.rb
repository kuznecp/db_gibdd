# frozen_string_literal: true

require 'faker'

BOOLS = %w[YES NO].freeze

HITS = ['Bonnet', 'Wing mirror', 'Door', 'Boot', 'Tyre',
        'Wheel', 'Indicator', 'Bumper', 'Headlight'].freeze

LEVEL = ['Small', 'Small Medium', 'Medium', 'High medium', 'High'].freeze

file = File.open('D:/Scripts_DB/information_script.sql', 'w')
file.write("INSERT INTO information (id, id_department, address, number_of_victims, stopper, data, place_of_hit, damage) values\n")
9_999.times do |i|
  file.write("(#{i + 1}, #{rand(1..500)}, '#{Faker::Address.full_address.gsub("'", "''")}', #{rand(1..30)},
 '#{BOOLS.sample}', '#{Faker::Date.between(from: '2015-04-25', to: '2022-04-25')}', '#{HITS.sample}', '#{LEVEL.sample}'),\n")
end
file.write("(10000, #{rand(1..500)}, '#{Faker::Address.full_address.gsub("'", "''")}', #{rand(1..30)},
 '#{BOOLS.sample}', '#{Faker::Date.between(from: '2015-04-25', to: '2022-04-25')}', '#{HITS.sample}', '#{LEVEL.sample}');\n")
file.close
