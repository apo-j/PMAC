class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :city
      t.string :postal
      t.string :country
      t.string :address_type
      t.belongs_to :user
      t.timestamps
    end

    add_index :addresses, :address_type

  end
end
