# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

pp @candidates

# Example of using the filters
puts "Experienced Candidates"
experience = experienced?(@candidates)
pp experience

puts "Candidate ID"
id = find(@candidates)
pp id

puts "Qualified Candidates:"
qualified = qualified_candidates?(@candidates)
pp qualified

puts "Candidates Ordered by Qualifications:"
ordered = ordered_by_qualifications?(@candidates)
pp ordered
