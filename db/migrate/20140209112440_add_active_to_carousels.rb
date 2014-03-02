class AddActiveToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :is_active, :boolean, default: false
  end
end
