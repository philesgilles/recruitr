class Position < ApplicationRecord
  has_many :position_skill
    has_many :skills, through: :position_skill
end
