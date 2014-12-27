class CreateRepeatIntervals < ActiveRecord::Migration
  def change
    create_table :repeat_intervals do |t|
      t.string :interval, null: false

      t.timestamps null: false
    end
  end
end
