class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :object
      t.string :email
      t.string :file_path
      t.string :message
      t.timestamps
    end
  end
end
