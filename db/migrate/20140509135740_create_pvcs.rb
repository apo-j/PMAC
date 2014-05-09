class CreatePvcs < ActiveRecord::Migration
  def change
    create_table :pvcs do |t|
      t.string pose
      t.string coloris
      t.string position_coloris
      t.string chassis
      t.string ouverture
      t.string sens
      t.string seuil_alu
      t.boolean sans_soubassement
      t.boolean seurre
      t.boolean oscillo_battant
      t.boolean poignee_a_cle
      t.boolean grill_aeration
      t.integer largeur
      t.integer hauteur
    end
  end
end
