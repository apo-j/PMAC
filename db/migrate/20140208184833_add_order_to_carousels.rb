class AddOrderToCarousels < ActiveRecord::Migration
  def change
    add_column :carousels, :order, :int, default: 0
  end
end
