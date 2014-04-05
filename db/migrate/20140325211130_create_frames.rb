class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.references :frameTypes, index:true
      t.string  :url
      t.boolean :sens
      t.timestamps
    end
  end
end
