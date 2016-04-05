class Tracker < ActiveRecord::Base
	before_save :set_date

	has_many :cardio_exercises, inverse_of: :tracker
	has_many :strength_exercises, inverse_of: :tracker

	accepts_nested_attributes_for :cardio_exercises
	accepts_nested_attributes_for :strength_exercises

	validates_associated :cardio_exercises

	private
	def set_date
		self.workout_date = Date.today if workout_date.nil?
	end
end
