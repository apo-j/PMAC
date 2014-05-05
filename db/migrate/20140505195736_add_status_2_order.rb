class AddStatus2Order < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_index :orders, :status, name: :idx_status
  end
end
