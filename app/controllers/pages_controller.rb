class PagesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
