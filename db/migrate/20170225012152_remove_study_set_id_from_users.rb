class RemoveStudySetIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :study_set_id, :integer
  end
end
