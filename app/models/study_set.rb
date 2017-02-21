class StudySet < ApplicationRecord
  belongs_to :user
  has_many :studiers, class_name: "User"
end
