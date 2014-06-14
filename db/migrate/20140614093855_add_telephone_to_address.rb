class AddTelephoneToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :telephone, :string
    add_column :addresses, :last_name, :string
  end
end
