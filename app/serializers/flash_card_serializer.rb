class FlashCardSerializer < ActiveModel::Serializer
  attributes :id, :term, :definition
  belongs_to :study_set
end
