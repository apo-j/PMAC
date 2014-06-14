class AddColumnToPvc < ActiveRecord::Migration
  def change
    add_column :pvcs, :traverse_intermediaire, :boolean
  end
end
