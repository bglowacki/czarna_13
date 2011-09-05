class RecentEventsController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
    
  def index
    @recent_events = RecentEvent.all(:limit => 10, :order => "id DESC")
  end
  
  def show
    @recent_event = RecentEvent.find(params[:id])
  end
  
  def new
    @admin = current_admin
    @recent_event = @admin.recent_events.build
  end
  
  def edit
    @recent_event = RecentEvent.find(params[:id])
  end
  
  def create
    @admin = current_admin
    @recent_event = @admin.recent_events.create(params[:recent_event])
    if @recent_event.save
      redirect_to recent_events_path
    else
      render "new"
    end
  end
  
end
