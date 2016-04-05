class StrengthExercise < ActiveRecord::Base
	belongs_to :tracker, inverse_of: :strength_exercises
end
