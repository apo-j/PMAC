class AddPageToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :page, :string
  end
end
