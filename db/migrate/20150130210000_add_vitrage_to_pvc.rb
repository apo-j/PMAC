class AddVitrageToPvc < ActiveRecord::Migration
  def change
    add_column :pvcs, :gamme, :string
    add_column :pvcs, :dormant, :string
    add_column :pvcs, :habillage_exterieur, :string
    add_column :pvcs, :piece_appui, :string
    add_column :pvcs, :grille_ventilation, :string
    add_column :pvcs, :volet_roulant, :string
    add_column :pvcs, :tablier, :string
    add_column :pvcs, :couleur_tablier, :string
    add_column :pvcs, :sens_tablier, :string
    add_column :pvcs, :manivelle, :string
    add_column :pvcs, :hauteur_sousbassement, :integer
    add_column :pvcs, :petits_bois, :string
    add_column :pvcs, :pbh, :integer
    add_column :pvcs, :pbv, :integer
  end
end
