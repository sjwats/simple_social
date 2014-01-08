class UserActivitiesController < ApplicationController
  def index
    @user_activities = UserActivity.all
  end

end
