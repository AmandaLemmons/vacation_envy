class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :photo
      t.string :token
      t.string :gender



      t.timestamps null: false
    end
  end
end
