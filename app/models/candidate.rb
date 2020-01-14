class Candidate < ApplicationRecord
    has_many :candidate_skill
    has_many :skills, through: :candidate_skill
end
