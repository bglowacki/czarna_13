class RecentEventsController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
    
  def index
    @recent_events = RecentEvent.order("id DESC")
  end
  
  def show
    @recent_event = RecentEvent.find(params[:id])
  end
  
  def new
    @recent_event = RecentEvent.new
    @recent_event.admin_name = current_admin.first_name + " " + current_admin.last_name
  end
  
  def create
    @admin = current_admin.id
    @recent_event = RecentEvent.new(params[:recent_event])
    @recent_event.admin_name = current_admin.first_name + " " + current_admin.last_name
    if @recent_event.save
      redirect_to recent_events_path
    else
      render "new"
    end
  end
  
end
