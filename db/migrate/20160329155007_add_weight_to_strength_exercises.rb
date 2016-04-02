class AddWeightToStrengthExercises < ActiveRecord::Migration
  def change
    add_column :strength_exercises, :weight, :integer
  end
end
