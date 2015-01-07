class CreateToken < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :user_id
      t.string :code
      t.integer :price
      t.timestamps
    end
  end
end
