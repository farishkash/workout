class AddStrengthExerciseToTrackers < ActiveRecord::Migration
  def change
  	add_reference  :trackers, :strength_exercise, index: true
  	add_foreign_key :trackers, :strength_exercises 
  end
end
