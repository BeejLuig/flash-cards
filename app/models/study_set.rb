class StudySet < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :owner, class_name: "User"
  has_many :flash_cards
  has_and_belongs_to_many :folders
  validates :title, presence: true
  accepts_nested_attributes_for :flash_cards, allow_destroy: true
end
