class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @activities = Activity.all
    @events = Event.all
  end

  def show
    @user = User.find(params[:id])
    @events = Event.all
    @activities = Activity.all
    @post = Post.new
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html do
          redirect_to user_path, notice: 'User Information Successfully Updated!'
        end

        format.json do
          render json: current_user
        end
      else
        format.html { redirect_to user_activities_path }
        format.json
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :home_town,:about_me, :current_location, :image, activity_ids: [], event_ids: [])
  end
end
