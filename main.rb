# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

pp @candidates

@candidates.each do |candidate|
  pp "EXPERIENCE: #{experienced?(candidate)}"
  pp  "ID:  #{find(candidate[:id])}"
  pp  "QUALIFIED:  #{qualified_candidates(@candidates)}"
  pp  "RANKING:  #{ordered_by_qualifications(@candidates)}"
end



