class CreateRepeatIntervals < ActiveRecord::Migration
  def change
    create_table :repeat_intervals do |t|
      t.integer :years, null: false, default: 0
      t.integer :months, null: false, default: 0
      t.integer :weeks, null: false, default: 0
      t.integer :days, null: false, default: 0
      t.string :interval, null: false
      t.string :label, null: false

      t.timestamps null: false
    end
  end
end
