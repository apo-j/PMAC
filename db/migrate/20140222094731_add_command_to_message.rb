class AddCommandToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :command, :string
  end
end
