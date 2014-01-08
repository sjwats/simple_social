class UsersController < ApplicationController
  def index
    @users = User.all
    @activities = Activity.all
  end

  def show
    @user = current_user
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
    params.require(:user).permit(:first_name, :last_name, :email, activity_ids: [])
  end
end
