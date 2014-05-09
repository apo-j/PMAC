class AddDetailToProduct < ActiveRecord::Migration
  def change
    add_column :products, :detail_id, :integer
    add_column :products, :detail_type, :string
  end
end
