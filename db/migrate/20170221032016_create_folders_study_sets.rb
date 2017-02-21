class CreateFoldersStudySets < ActiveRecord::Migration[5.0]
  def change
    create_table :folders_study_sets do |t|
      t.integer :folder_id
      t.integer :study_set_id
    end
  end
end
