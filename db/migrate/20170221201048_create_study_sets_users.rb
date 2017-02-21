class CreateStudySetsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :study_sets_users do |t|
      t.integer :study_set_id
      t.integer :user_id
    end
  end
end
