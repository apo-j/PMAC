class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest
      t.string :user_type
      t.timestamps
    end

    add_index :users, :login, unique: true
    add_index :users, :user_type

    execute %{
    ALTER TABLE addresses
    ADD CONSTRAINT fk_address
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE;
    }

    execute %{
    ALTER TABLE people
    ADD CONSTRAINT fk_person
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE;
    }

  end
end
