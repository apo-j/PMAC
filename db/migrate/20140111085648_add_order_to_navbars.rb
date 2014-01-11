class AddOrderToNavbars < ActiveRecord::Migration
  def change
    add_column :navbars, 'order', :integer
  end
end
