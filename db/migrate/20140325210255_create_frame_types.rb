class CreateFrameTypes < ActiveRecord::Migration
  def change
    create_table :frame_types do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
  end
end
