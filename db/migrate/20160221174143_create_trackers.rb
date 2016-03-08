class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.date :workout_date

      t.timestamps null: false
    end
  end
end
