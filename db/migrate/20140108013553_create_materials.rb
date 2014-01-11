class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    add_index :materials, :code

  end
end
