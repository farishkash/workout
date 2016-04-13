class StrengthExercisesController < ApplicationController
  respond_to :html, :js

  def new
    @tracker = Tracker.find(params[:tracker_id])
    @strength_exercise = @tracker.strength_exercises.build

  end

  def create
    @tracker = Tracker.find(params[:tracker_id])
    @strength_exercise = @tracker.strength_exercises.create(strengthexercise_params)

    if @strength_exercise.save
      flash[:success]="The strength exercise has been added"
      redirect_to (@tracker)

    else

      render 'new'
    end
  end

  def edit
    @tracker = Tracker.find(params[:tracker_id])
    @strength_exercise = @tracker.strength_exercises.find(params[:id])
  end

  def update
    @tracker = Tracker.find(params[:tracker_id])
    @strength_exercise = @tracker.strength_exercises.find(params[:id])

    if@strength_exercise.update_attributes(strengthexercise_params)
      flash[:success] ="The strength exercise has been updated"
      redirect_to @tracker
    else
      render 'edit'
    end
  end

  def show

    @tracker = Tracker.find(params[:tracker_id])

    @strength_exercise = @tracker.strength_exercises.find(params[:id])

  end

  private



  def strengthexercise_params

    params.require(:strength_exercise).permit(:strength_exercise_name, :sets, :reps, :weight)

  end
end
