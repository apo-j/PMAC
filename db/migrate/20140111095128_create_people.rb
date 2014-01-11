class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.string :fax
      t.string :fix_tel
      t.string :mobile_tel
      t.belongs_to :user
      t.timestamps
    end

    add_index :people, :mail

  end
end
