class StudySet < ApplicationRecord
  has_and_belongs_to_many :studiers, class_name: "User"
  belongs_to :owner, class_name: "User"

  has_many :flash_cards
  has_and_belongs_to_many :folders
  validates :title, presence: true
end
