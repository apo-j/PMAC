class ModifyModePictureToImageUrl < ActiveRecord::Migration
  def change
    remove_column :modes, :picture
    add_column :modes, :image_url, :string
  end
end
