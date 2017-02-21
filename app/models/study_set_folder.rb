class StudySetFolder < ApplicationRecord
  belongs_to :folder
  belongs_to :study_set
end
