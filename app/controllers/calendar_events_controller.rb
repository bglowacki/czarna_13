class CalendarEventsController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
  
  def new
    @calendar_event = CalendarEvent.new
  end
  
  def create
    @calendar_event = CalendarEvent.new(params[:calendar_event])
    if @calendar_event.save
      redirect_to :root
    else
      render "new"
    end
  end
  
  def edit
    @calendar_event = CalendarEvent.find(params[:id])
  end
  
  def update
    @calendar_event = CalendarEvent.find(params[:id])
    if @calendar_event.update_attributes(params[:calendar_event])
      redirect_to :root
    else
      render "edit"
    end
  end
  
  def index
    @calendar_events = CalendarEvent.all
  end
  
  def show
    @calendar_event = CalendarEvent.find(params[:id])
  end
end
