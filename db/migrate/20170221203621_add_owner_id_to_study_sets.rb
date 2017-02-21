class AddOwnerIdToStudySets < ActiveRecord::Migration[5.0]
  def change
    add_column :study_sets, :owner_id, :integer
  end
end
