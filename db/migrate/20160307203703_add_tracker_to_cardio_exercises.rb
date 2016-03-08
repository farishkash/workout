class AddTrackerToCardioExercises < ActiveRecord::Migration
  def change
  	add_reference :cardio_exercises, :tracker, index: true
  	add_foreign_key :cardio_exercises, :trackers
  end
end
