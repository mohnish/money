class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :bill, index: true
      t.decimal :amount, precision: 8, scale: 2
      t.references :payment_source, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :bills
    add_foreign_key :payments, :payment_sources
  end
end
