class CreateRideauxMetaliques < ActiveRecord::Migration
  def change
    create_table :rideaux_metaliques do |t|
      t.string :lame
      t.integer :largeur
      t.integer :hauteur
      t.integer :hauteur_lame_cobra
      t.integer :hauteur_lame_microperforet
      t.boolean :boitre_a_cle_exterieur
      t.boolean :bouton_poussoire
      t.boolean :telecommande
      t.boolean :sabot_viro
      t.timestamps
    end
  end
end
