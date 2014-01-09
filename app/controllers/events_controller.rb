class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  private

  def events_params
    params.require(:event).permit(:date, :start_time, :end_time, :city, :state, :description, :status, :activity_id)
  end
end
