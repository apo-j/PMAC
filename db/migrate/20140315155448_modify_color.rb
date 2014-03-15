class ModifyColor < ActiveRecord::Migration
  def change
    add_column :colors, :is_double_side, :boolean
    add_column :colors, :price_advance, :integer
  end
end
