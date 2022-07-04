# frozen_string_literal: true

require 'faker'

CATEGORIES = ['A', 'B', 'C', 'D', 'E', 'F', 'S', 'M', 'J'].freeze

file = File.open('D:/Scripts_DB/drivers_script.sql', 'w')
file.write("INSERT INTO drivers (id, id_profile, id_case, id_car, id_insurance, category) values\n")
99_999.times do |i|
  file.write("(#{i + 1}, #{i + 1}, #{rand(1..10000)}, #{rand(1..100000)}, #{rand(1..50)}, '#{CATEGORIES.sample}'),\n")
end
file.write("(100000, 100000, #{rand(1..10000)}, #{rand(1..100000)}, #{rand(1..50)}, '#{CATEGORIES.sample}');\n")
file.close

