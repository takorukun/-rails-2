class AddPostImageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_image, :string
  end
end
