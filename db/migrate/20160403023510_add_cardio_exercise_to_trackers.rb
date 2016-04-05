class AddCardioExerciseToTrackers < ActiveRecord::Migration
  def change
  	add_reference  :trackers, :cardio_exercise, index: true
  	add_foreign_key :trackers, :cardio_exercises 
  end
end
