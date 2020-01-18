class Meeting < ApplicationRecord
    belongs_to :recruiter, optional: true
    belongs_to :candidate, optional: true
end