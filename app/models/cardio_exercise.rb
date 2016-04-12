class CardioExercise < ActiveRecord::Base
  belongs_to :tracker, inverse_of: :cardio_exercises
  validates_presence_of :tracker
end
