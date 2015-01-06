class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :label, null: false

      t.timestamps null: false
    end
  end
end
