class ModifyWithToWidth < ActiveRecord::Migration
  def change
    remove_column :products, :with
    add_column :products, :width, :integer
  end
end
