class ModifyOrderAddress < ActiveRecord::Migration
  def change
    remove_column :orders, :address
    add_column :addresses, :address_type, :integer
  end
end
