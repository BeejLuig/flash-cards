class AddStudySetIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :study_set_id, :integer
  end
end
