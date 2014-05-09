class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :largeur
      t.integer :avancer
      t.string :manoeuvre
      t.string :toile
      t.timestamps
    end
  end
end
