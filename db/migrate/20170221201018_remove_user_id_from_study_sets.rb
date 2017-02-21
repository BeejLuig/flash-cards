class RemoveUserIdFromStudySets < ActiveRecord::Migration[5.0]
  def change
    remove_column :study_sets, :user_id, :integer
  end
end
