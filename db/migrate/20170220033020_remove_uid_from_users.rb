class RemoveUidFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :uid, :integer
  end
end
