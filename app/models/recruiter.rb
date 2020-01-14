class Recruiter < ApplicationRecord
    has_many :recruiter_skill
    has_many :skills, through: :recruiter_skill
end
