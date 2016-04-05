class StrengthExercisesController < ApplicationController
	
    def new
	    @tracker = Tracker.find(params[:tracker_id])
      @strength_exercise = @tracker.strength_exercises.build

    end
	  def create
      @tracker = Tracker.find(params[:tracker_id])
      @strength_exercise = @tracker.strength_exercises.create(strengthexercise_params)
        
        if @strength_exercise.save
           flash[:notice]="The exercise has been added"
           redirect_to [@tracker, @strength_exercise]

        else

          render 'new'
        end
    end
    def show
    
      @tracker = Tracker.find(params[:tracker_id])
      @cardio_exercise = @tracker.cardio_exercises.find(params[:id])
      @strength_exercise = @tracker.strength_exercises.find(params[:id])

    end

private

 

    def strengthexercise_params
    
      params.require(:strength_exercise).permit(:strength_exercise_name, :sets, :reps)
  
    end
end