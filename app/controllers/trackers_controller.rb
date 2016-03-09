class TrackersController < ApplicationController
	def index
		@workouts = Tracker.all
		@workout = Tracker.new
	end

	def new
		@workout = Tracker.new
	end

	def create

		@workout = Tracker.create
		if@workout.save
			redirect_to @workout
		else
			render '/'
		end
	end
	def show
		@workout = Tracker.find(params[:id])
	end
	private
	def tracker_params
		params.require(:tracker).permit(:workout_date)
	end
end
