class AddImageToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string, default: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Mr._Smiley_Face.svg/2000px-Mr._Smiley_Face.svg.png"
  end
end
