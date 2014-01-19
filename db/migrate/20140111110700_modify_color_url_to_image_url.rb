class ModifyColorUrlToImageUrl < ActiveRecord::Migration
  def change
    remove_column :colors, :url
    add_column :colors, :image_url, :string
  end
end
