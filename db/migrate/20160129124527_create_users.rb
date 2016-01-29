class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email, null: false, unique: true, index: true
      t.text :password_digest, null: false

      t.timestamps null: false
    end
  end
end
