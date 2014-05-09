class AddStatus2Order < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string
    add_index :orders, :state, name: :idx_state
  end
end
