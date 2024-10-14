class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.boolean :is_admin, null: false, default: false 

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
