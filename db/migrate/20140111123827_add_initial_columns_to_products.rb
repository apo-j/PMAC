class AddInitialColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :material, :string
    add_column :products, :color, :string
    add_column :products, :color_side, :string
    add_column :products, :mode, :string
    add_column :products, :with, :decimal
    add_column :products, :height, :decimal
    add_column :products, :total_price, :decimal, precision:  8, scale: 2
  end
end
