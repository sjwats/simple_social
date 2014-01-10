class ActivitiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to user_activities_path, notice: 'Successfully added an activity'
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end
  protected

  def activity_params
    params.require(:activity).permit(:name)
  end

end
