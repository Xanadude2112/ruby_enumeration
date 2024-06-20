require 'active_support/all'
require './candidates'
# Takes in an id
# Returns the candidate with that :id
# If there is no candidate with that id, it naturally returns nil
def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  nil
end

# Takes in a single candidate (hash). Note: not the array.
# Returns true if the candidate has 2 years of experience or more
# Returns false otherwise
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def github_points?(candidate)
  candidate[:github_points] >= 100
end

def knows_ruby_or_python?(candidate)
  languages = candidate[:languages]
  languages.include?('Ruby') || languages.include?('Python')
end

def applied_recently?(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def age_qualified?(candidate)
  candidate[:age] > 17
end

# Takes in a collection of candidates
# Returns a subset of the candidates that meet the following criteria:
# - Are experienced
# - Have 100 or more Github points
# - Know at least Ruby or Python
# - Applied in the last 15 days
# - Are over the age of 17 (18+)
def qualified_candidates(candidates)
  candidates.select do |candidate|
    experienced?(candidate) &&
    github_points?(candidate) &&
    knows_ruby_or_python?(candidate) &&
    applied_recently?(candidate) &&
    age_qualified?(candidate)
  end
end

# Takes in a collection of candidates
# Instead of filtering on the candidates, returns them all back but reordered such that:
# - Candidates with the most experience are at the top
# - For Candidates that have the same years of experience, they are further sorted by their number of Github points (highest first)
def ordered_by_qualifications(candidates)
  candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end

# More methods will go below
