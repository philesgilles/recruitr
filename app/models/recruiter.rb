class Recruiter < ApplicationRecord
    has_many :recruiter_skill, dependent: :delete_all
    has_many :skills, through: :recruiter_skill
end
