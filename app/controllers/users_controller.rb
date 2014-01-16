class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @activities = Activity.all
    @events = Event.all
  end

  def show
    @user = current_user
    @events = Event.all
    @activities = Activity.all
  end

  def update
    if current_user.update(user_params)
      current_user.save
      redirect_to user_path, notice: 'User Information Successfully Updated!'
    else
      redirect_to user_activities_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :home_town,:about_me, :current_location, :image, activity_ids: [], event_ids: [])
  end
end
