class EventsController < ApplicationController
  def index
    @upcoming_events = Event.all.upcoming
    @past_events = Event.all.already_happened
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)

    if event.save
      redirect_to event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :link,
      :date,
      :user_id
    )
  end
end
