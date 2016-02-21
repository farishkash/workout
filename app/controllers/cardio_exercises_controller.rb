class CardioExercisesController < ApplicationController
  before_action :find_exercise, only: [:show, :edit, :update]

  def index
    @exercises = CardioExercise.all
  end

  def new
    @exercise = CardioExercise.new
  end

  def create
    @exercise = CardioExercise.create(cardioexercise_params)
    if @exercise.save
      flash[:notice]="The exercise has been added"
      redirect_to @exercise
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
   
  end

  def update
    

    if@exercise.update_attributes(cardioexercise_params)
      flash[:notice]="The exercise has been updated"
      redirect_to @exercise
    else
      render 'edit'
    end   
  end
  

  private

  def find_exercise
    @exercise = CardioExercise.find(params[:id])
  end

  def cardioexercise_params
    params.require(:cardio_exercise).permit(:cardio_exercise_name, :time_minutes, :calories_burned)
  end
end
