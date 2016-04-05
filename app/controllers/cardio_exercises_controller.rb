class CardioExercisesController < ApplicationController
  before_action :find_tracker, only:  [:new, :create, :show, :edit, :update]
  before_action :find_cardio_exercise, only: [:show, :edit]

  respond_to :html, :js

  def index
    
  end

  def new
    @cardio_exercise = CardioExercise.new
  end

  def create
    @cardio_exercise = @tracker.cardio_exercises.create(cardioexercise_params)
      
      if @cardio_exercise.save
        flash[:notice]="The exercise has been added"
        redirect_to (@tracker)
      else
        render 'new'
      end
  end

  def show
    @cardio_exercises = @tracker.cardio_exercises
  end

  def edit
  
  end

  def update
    @cardio_exercise = @tracker.cardio_exercises.build

      if@cardio_exercise.update_attributes(cardioexercise_params)
        flash[:notice]="The exercise has been updated"
        redirect_to [@tracker, @cardio_exercise]
      else
        render 'edit'
      end   
  end
  

  private

  def find_tracker
    @tracker = Tracker.find(params[:tracker_id])
  end
  def find_cardio_exercise
    @cardio_exercise = @tracker.cardio_exercises.find(params[:id])
  end

  def cardioexercise_params
    params.require(:cardio_exercise).permit(:cardio_exercise_name, :time_minutes, :calories_burned)
  end
end
