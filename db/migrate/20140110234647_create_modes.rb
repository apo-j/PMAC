class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.string :category
      t.string :code
      t.string :picture
      t.boolean :is_top
      t.belongs_to :price
      t.timestamps
    end

    execute %{
      ALTER TABLE modes
      ADD CONSTRAINT fk_mose
      FOREIGN KEY (price_id)
      REFERENCES prices(id)
      ON DELETE CASCADE;
    }

    add_index :modes, [:category, :is_top]
    add_index :modes, :code
  end
end
