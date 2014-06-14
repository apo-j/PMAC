class AddAddressToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :address, :string
    remove_column :addresses, :address_type
  end
end
