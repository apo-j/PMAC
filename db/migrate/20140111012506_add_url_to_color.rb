class AddUrlToColor < ActiveRecord::Migration
  def change
    add_column :colors, 'url', :string
  end
end
