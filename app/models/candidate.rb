class Candidate < ApplicationRecord
    has_many :candidate_skill, dependent: :delete_all
    has_many :skills, through: :candidate_skill
    belongs_to :recruiter, optional: true
    belongs_to :position, optional: true
    has_many :meetings,  dependent: :destroy
end