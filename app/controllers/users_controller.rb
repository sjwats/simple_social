class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path, notice: 'Activities have been updated'
    else
      rendirect_to user_activities_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
