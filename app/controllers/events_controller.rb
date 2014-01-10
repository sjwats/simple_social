class EventsController < ApplicationController
  def index
    @events = Event.all
    @activities = Activity.all
    @users = User.all
  end

  def new
    @event = Event.new
    @activities = Activity.all

  end

  def create
    @event = current_user.events.build(event_params)#builds the event for the current user
    if @event.save
      redirect_to user_event_path(current_user, @event), notice: 'Event Created Successfully'
      binding.pry
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
    @activities = Activity.all
  end

  private

  def event_params
    params.require(:event).permit(:start_time, :end_time, :city, :state, :description, :location_name, :street_address, :num_attendees_requested, :activity_id)
  end
end
