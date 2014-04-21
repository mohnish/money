class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :price, precision: 8, scale: 2
      t.string :store
      t.string :comment
      t.references :user, index: true

      t.timestamps
    end
  end
end
