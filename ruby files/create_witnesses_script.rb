# frozen_string_literal: true

require 'faker'

BOOLS = %w[YES NO].freeze

file = File.open('D:/Scripts_DB/witnesses_script.sql', 'w')
file.write("INSERT INTO witnesses (id, id_profile, id_case, defend, in_group) values\n")
999.times do |i|
  file.write("(#{i + 1}, #{100000 + i + 1}, #{rand(1..10000)}, '#{BOOLS.sample}', '#{BOOLS.sample}'),\n")
end
file.write("(1000, #{100000 + 1000 + 1}, #{rand(1..10000)}, '#{BOOLS.sample}', '#{BOOLS.sample}');\n")
file.close

