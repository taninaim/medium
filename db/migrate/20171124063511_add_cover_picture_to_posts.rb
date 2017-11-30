class AddCoverPictureToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :cover_picture_data, :text
  end
end
