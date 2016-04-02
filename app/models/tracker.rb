class Tracker < ActiveRecord::Base
	before_save :set_date

	has_many :cardio_exercises
	has_many :strength_exercises

	private
	def set_date
		self.workout_date = Date.today if workout_date.nil?
	end
end
