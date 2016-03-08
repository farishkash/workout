class Tracker < ActiveRecord::Base
	before_save :set_date

	def set_date
		self.workout_date = Date.today
	end

	has_many :cardio_exercises
end
