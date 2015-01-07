class CreateToken < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :user_id
      t.string :code
      t.datetime :date_expiration
      t.timestamps
    end
  end
end
