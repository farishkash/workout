class TrackersController < ApplicationController
	respond_to :html, :js

	def index
		@trackers = Tracker.all
		@tracker = Tracker.new
	end

	def new
		@tracker = Tracker.new
		@cardio_exercise = @tracker.cardio_exercises.build
	end


	def create

		@tracker= Tracker.create
		  if@tracker.save
			redirect_to tracker_path(@tracker)
		  else
			render '/'
		  end
	end

	def update
        @tracker = Tracker.find(params[:id])
	      if @tracker.update_attributes(tracker_params)
            redirect_to tracker_path(@tracker)
          else
            render 'edit'
          end
	end

	def show
		@tracker = Tracker.find(params[:id])
		@cardio_exercises = @tracker.cardio_exercises

	end
	private
	def tracker_params
		params.require(:tracker).permit(:workout_date, :cardio_id,
			                            cardio_exercises_attributes:[:id, :cardio_exercise_name, :time_minutes, :calories_burned, :tracker_id ]) 
	end
end
