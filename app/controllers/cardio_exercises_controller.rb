class CardioExercisesController < ApplicationController
  #before_action :find_exercise, only: [:show, :edit, :update]
  respond_to :html, :js

  def index
    
  end

  def new
    @cardio_exercise = CardioExercise.new
    @tracker = Tracker.find(params[:tracker_id])
    
  end

  def create
    @tracker = Tracker.find(params[:tracker_id])
    @cardio_exercise = @tracker.cardio_exercises.create(cardioexercise_params)
    if @cardio_exercise.save
      flash[:notice]="The exercise has been added"
      redirect_to (@tracker)
    else
      render 'new'
    end
  end

  def show
    @tracker = Tracker.find(params[:tracker_id])
    @cardio_exercise = @tracker.cardio_exercises.find(params[:id])
    @cardio_exercises = @tracker.cardio_exercises

  end

  def edit
  @tracker = Tracker.find(params[:tracker_id])
  @cardio_exercise = @tracker.cardio_exercises.find(params[:id])
  end

  def update
    @tracker = Tracker.find(params[:tracker_id])
    @cardio_exercise = @tracker.cardio_exercises.build

    if@cardio_exercise.update_attributes(cardioexercise_params)
      flash[:notice]="The exercise has been updated"
      redirect_to (@tracker)
    else
      render 'edit'
    end   
  end
  

  private

  def find_exercise
    @cardio_exercise = CardioExercise.find(params[:id])
  end

  def cardioexercise_params
    params.require(:cardio_exercise).permit(:cardio_exercise_name, :time_minutes, :calories_burned)
  end
end
