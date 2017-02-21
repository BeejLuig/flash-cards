class RemoveIsStarredFromFlashCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :flash_cards, :is_starred, :boolean
  end
end
