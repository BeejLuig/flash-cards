class FlashCard < ApplicationRecord
  belongs_to :study_set
  validates :term, :definition, presence: true
end
