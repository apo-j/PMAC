class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :code
      t.integer :price
      t.timestamps
    end

    add_index :colors, :code

  end
end
