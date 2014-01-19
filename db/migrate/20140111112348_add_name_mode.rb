class AddNameMode < ActiveRecord::Migration
  def change
    add_column :modes, :name, :string
  end
end
