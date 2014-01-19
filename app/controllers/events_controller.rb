class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = Event.all

  end

  def new
    @event = Event.new
    @activities = Activity.all

  end

  def create
    @event = current_user.events.build(event_params)#builds the event for the current user
    if @event.save
      redirect_to user_event_path(current_user, @event), notice: 'Event Created Successfully' #the route requires two inputs to get to the right place. check rake routes to see.
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
    @users = User.all
  end

  def join
    @user = current_user
    @event = Event.find(params[:id])
    @event.users << @user
    redirect_to user_event_path(@user, @event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id]) # has to match Edit with params[:id] otherwise undefined method `update' for nil:NilClass
    if @event.update(event_params)
      redirect_to user_event_path(current_user, @event), notice: 'Successfully Updated!'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_events_path(current_user), notice: "Event successfully deleted"
  end

  private

  def event_params
    params.require(:event).permit(:start_time, :end_time, :city, :state, :description, :location_name, :street_address, :num_attendees_requested, :activity_id)
  end
end
