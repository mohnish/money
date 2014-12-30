class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.references :user, index: true
      t.references :category, index: true
      t.references :repeat_interval, index: true
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :bills, :users
    add_foreign_key :bills, :categories
    add_foreign_key :bills, :repeat_intervals
  end
end
