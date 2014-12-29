class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :entity, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
