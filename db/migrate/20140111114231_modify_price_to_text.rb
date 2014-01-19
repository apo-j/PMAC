class ModifyPriceToText < ActiveRecord::Migration
  def change
    remove_column :prices, :width
    remove_column :prices, :height
    remove_column :prices, :price

    add_column :prices, :widths, :text
    add_column :prices, :heights, :text
    add_column :prices, :prices, :text
  end
end
