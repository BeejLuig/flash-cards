class StudySet < ApplicationRecord
  belongs_to :user
  has_many :studiers, class_name: "User"
  has_many :flash_cards
  has_and_belongs_to_many :folders
end
