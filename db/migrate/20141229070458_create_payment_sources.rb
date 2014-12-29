class CreatePaymentSources < ActiveRecord::Migration
  def change
    create_table :payment_sources do |t|
      t.string :name
      t.string :type
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :payment_sources, :users
  end
end
