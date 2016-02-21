class CreateCardioExercises < ActiveRecord::Migration
  def change
    create_table :cardio_exercises do |t|
      t.string :cardio_exercise_name
      t.integer :time_minutes
      t.integer :calories_burned

      t.timestamps null: false
    end
  end
end
