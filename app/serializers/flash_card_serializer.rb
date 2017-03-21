class FlashCardSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :study_set
end
