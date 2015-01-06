class AddState2User < ActiveRecord::Migration
  def change
    add_column :users, :state, :integer
    add_index :users, :state, name: :idx_state
  end
end
