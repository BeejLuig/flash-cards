class StudySet < ApplicationRecord
  has_and_belongs_to_many :studiers, class_name: "User"
  belongs_to :owner, class_name: "User"
  has_many :flash_cards
  has_and_belongs_to_many :folders

  validates :title, presence: true

  # accepts_nested_attributes_for :flash_cards, allow_destroy: true

  def flash_cards_attributes=(attributes)
    self.flash_cards.destroy_all
    attributes.each do |i, hash|
      unless hash["_destroy"] == "1"
        flash_card = self.flash_cards.new(term: hash[:term], definition: hash[:definition])
        self.save
      end
    end
  end

  def make_copy(user)
    copy = self.dup
    self.flash_cards.each do |flash_card|
      copy.flash_cards << flash_card.dup
    end
    user.study_sets << copy
    copy.owner = user
    user.save
    copy.save
  end

  def add_studier(user)
    if !self.studiers.include?(user)
      self.studiers << user
      self.save
    end
  end

  def self.search(search)
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end

end
