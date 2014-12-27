class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :email, default: false
      t.boolean :phone, default: false

      t.timestamps null: false
    end
  end
end
