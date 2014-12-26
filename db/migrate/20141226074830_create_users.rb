class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address, null: false
      t.string :username, null: false
      t.string :avatar
      t.string :phone_number
      t.string :password
      t.string :password_confirmation
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end
end
