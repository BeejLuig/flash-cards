class Folder < ApplicationRecord
  belongs_to :user
  has_many :study_sets, through: :study_set_folders
end
