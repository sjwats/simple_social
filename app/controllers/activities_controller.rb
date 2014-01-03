class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path, notice: 'Successfully added an activity'
    else
      redirect_to new_activity_path, notice: 'Please fill out all required information'
    end
  end

  protected

  def activity_params
    params.require(:activity).permit(:name)
  end

end
