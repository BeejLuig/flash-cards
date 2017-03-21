class StudySetSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :flash_cards
  belongs_to :owner
end
