class AddIsStarredToFlashCards < ActiveRecord::Migration[5.0]
  def change
    add_column :flash_cards, :is_starred, :boolean, default: false
  end
end
