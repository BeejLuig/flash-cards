class FlashCardSerializer < ActiveModel::Serializer
  attributes :id, :term, :definition, :is_starred
  belongs_to :study_set
end
