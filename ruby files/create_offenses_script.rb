# frozen_string_literal: true
# done
require 'faker'

PUNISHMENTS = ['Warning', 'Administration fine', 'Detaining a car', 'Deprivation of a license'].freeze

SUBJECTS = ['drivers', 'bicyclist', 'walker', 'passenger'].freeze

REASONS = ['Alcohol', 'Talking', 'Poor condition', 'Bad road', 'Bad weather', 'Inattention'].freeze

TYPES = ['Administrative misconduct', 'Material misconduct', 'Particularly serious crime', 'Crimes of moderate severity', 'Minor crimes'].freeze

TYPES_OF_DTP = ['Collision', 'Rollover', 'Hitting', 'Passenger fall', 'Cargo drop'].freeze

file = File.open('D:/Scripts_DB/offenses_script.sql', 'w')
file.write("INSERT INTO offenses (id, id_department, type, punishment, subject, reason) values\n")
9999.times do |i|
  file.write("(#{i + 1}, #{rand(1..500)}, '#{TYPES.sample}', '#{PUNISHMENTS.sample}', '#{SUBJECTS.sample}', '#{REASONS.sample}'),\n")
end
file.write("(10000, #{rand(1..500)}, '#{TYPES.sample}', '#{PUNISHMENTS.sample}', '#{SUBJECTS.sample}', '#{REASONS.sample}');\n")
file.close
