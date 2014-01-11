class CreateNavbars < ActiveRecord::Migration
  def change
    create_table :navbars do |t|
      t.string :name
      t.string :code
      t.string :picture
      t.boolean :is_top
      t.belongs_to :parent, class_name: 'Navbar'
      t.timestamps
    end

    execute %{
        ALTER TABLE navbars
    ADD CONSTRAINT fk_navbar
    FOREIGN KEY (parent_id)
    REFERENCES navbars (id)
    ON DELETE CASCADE;
    }

    add_index :navbars, :code
    add_index :navbars, :is_top

  end
end
