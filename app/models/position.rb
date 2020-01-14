class Position < ApplicationRecord
  has_many :position_skill
  has_many :skills, through: :position_skill
  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :description, presence: true, length: {minimum:10, maximum:10000}
end
