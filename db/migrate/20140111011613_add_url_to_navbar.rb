class AddUrlToNavbar < ActiveRecord::Migration
  def change
    add_column :navbars, :url, :string
  end
end
