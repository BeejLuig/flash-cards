class StudySetSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :owner_id
  has_many :flash_cards
end
