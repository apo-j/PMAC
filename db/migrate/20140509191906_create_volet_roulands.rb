class CreateVoletRoulands < ActiveRecord::Migration
  def change
    create_table :volet_roulands do |t|
      t.string :tablier
      t.string :coloris_tablier
      t.string :coloris_autre
      t.string :position_coffre
      t.integer :largeur
      t.integer :hauteur
      t.string :manoeuvre
      t.timestamps
    end
  end
end
