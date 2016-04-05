class TrackersController < ApplicationController
	respond_to :html, :js

	def index
		@trackers = Tracker.all
		@tracker = Tracker.new
	end

	def new
		@tracker = Tracker.new
		@cardio_exercise = @tracker.cardio_exercises.build
		#@tracker.strength_exercises.build



	end

	def add_cardio
		@tracker = Tracker.find(params[:id])
		#@tracker = Tracker.new
		@cardio_exercise =  @tracker.cardio_exercises.build
          respond_to do |format|
            format.js { render partial: 'showcardio' }
          end
       end

       def save_cardio
       	 @tracker = Tracker.find(params[:id])
         @cardio_exercise = @tracker.cardio_exercises.create(params[:cardio_exercises_attributes])
            #@cardio_exercise = @tracker.cardio_exercises.build
           if @cardio_exercise.save
             flash[:success] = "The exercise has been added."
             redirect_to tracker_path(@tracker)
           else
   	         render tracker_path(@tracker)
           end
       end

	def cardio
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
		@cardio_exercise = 
		@tracker =Tracker.find(params[:tracker_id])
		 if @tracker.update_attributes(tracker_params)
      flash[:success] = "The exercise has been added."
       redirect_to tracker_path(@tracker)
  end
	end

	def show
		@tracker = Tracker.find(params[:id])
		#@cardio_exercise = @tracker.cardio_exercises.build
		@cardio_exercises = @tracker.cardio_exercises

	end
	private
	def tracker_params
		params.require(:tracker).permit(:workout_date, :cardio_id,
			                            cardio_exercises_attributes:[:id, :cardio_exercise_name, :time_minutes, :calories_burned, :tracker_id ]) 
	end
end
