class Folder < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :study_sets
  validates :name, :user_id, presence: true
end
