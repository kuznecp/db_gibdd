# frozen_string_literal: true
# done
require 'faker'

PENALTIES = [100, 300, 500, 1000, 5000, 10000, 50000, 100000].freeze

file = File.open('D:/Scripts_DB/penalty_script.sql', 'w')
file.write("INSERT INTO penalty (id, id_offenses, sum, data) values\n")
99_999.times do |i|
  file.write("(#{i + 1}, #{rand(1..9999)}, #{PENALTIES.sample}, '#{Faker::Date.between(from: '2015-04-25', to: '2022-04-25')}'),\n")
end
file.write("(100000, #{rand(1..9999)}, #{PENALTIES.sample}, '#{Faker::Date.between(from: '2015-04-25', to: '2022-04-25')}');\n")
file.close
