class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to @event, notice: 'Event saved.'
    else
      flash.now[:alert] = 'Event not saved.'
      render :new
    end
  end

  def edit
  end

  def update
    @event = RegisteredApplication.find(params[:id])
    @event.assign_attributes(event_params)
    
    if @event.save
      flash[:notice] = "Event updated"
      redirect_to @event
    else
      flash.now[:alert] = "Error updating event"
      render :edit
    end
  end

  def destroy
    @events = Event.find(params[:id])
    
    if @events.destroy
      flash[:notice] = "\"#{@events.name}\" was deleted"
      redirect_to action: :show
    else
      flash.now[:alert] = "Error deleting event"
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name, :registered_application_id)
  end
end
