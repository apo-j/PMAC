class CreateNavbars < ActiveRecord::Migration
  def change
    create_table :navbars do |t|

      t.timestamps
    end
  end
end
