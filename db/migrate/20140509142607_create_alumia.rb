class CreateAlumia < ActiveRecord::Migration
  def change
    create_table :alumia do |t|
      t.string profile
      t.string pose
      t.string coloris
      t.string chassis
      t.integer largeur
      t.integer hauteur
      t.timestamps
    end
  end
end
