class RecentEventsController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
    
  def index
    @recent_events = RecentEvent.order("id DESC")
  end
  
  def new
    @recent_event = RecentEvent.new
  end
  
  def create
    @recent_event = RecentEvent.new(params[:recent_event])
    if @recent_event.save
      redirect_to recent_events_path
    else
      render "new"
    end
  end
  
end
