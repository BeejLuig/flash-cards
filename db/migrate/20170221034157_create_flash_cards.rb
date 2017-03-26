class CreateFlashCards < ActiveRecord::Migration[5.0]
  def change
    create_table :flash_cards do |t|
      t.integer :study_set_id
      t.string :term
      t.string :definition
    end
  end
end
