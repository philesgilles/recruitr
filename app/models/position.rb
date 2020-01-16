class Position < ApplicationRecord
  has_many :position_skill, dependent: :delete_all
  has_many :skills, through: :position_skill
  has_many :candidates
  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :description, presence: true, length: {minimum:10, maximum:10000}
end
