class AddTrackerToStrengthExercises < ActiveRecord::Migration
  def change
  	add_reference :strength_exercises, :tracker, index: true
  	add_foreign_key :strength_exercises, :trackers
  end
end
