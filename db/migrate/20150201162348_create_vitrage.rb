class CreateVitrage < ActiveRecord::Migration
  def change
    create_table :vitrages do |t|
      t.string :type_vitrage
      t.string :decor
      t.belongs_to :pvc
    end
  end
end
