class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :target
      t.string :src
      t.string :alt_text

      t.timestamps
    end
  end
end
