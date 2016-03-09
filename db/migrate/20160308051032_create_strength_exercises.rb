class CreateStrengthExercises < ActiveRecord::Migration
  def change
    create_table :strength_exercises do |t|
      t.string :strength_exercise_name
      t.integer :sets
      t.integer :reps

      t.timestamps null: false
    end
  end
end
