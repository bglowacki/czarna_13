class ScoutTeamsController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :edit, :destroy]
  
  def index
    @scout_teams = ScoutTeam.order("came_into_being DESC")
  end
  
  def show
    @scout_team = ScoutTeam.find(params[:id])
  end
  
  def new
    @scout_team = ScoutTeam.new
  end
  
  def create
    @scout_team = ScoutTeam.new(params[:scout_team])
    if @scout_team.save
      redirect_to @scout_team
    else
      render "new"
    end
  end
  
  def edit
    @scout_team = ScoutTeam.find(params[:id])
  end
  
  def update
    @scout_team = ScoutTeam.find(params[:id])
    if @scout_team.update_attributes(params[:scout_team])
      redirect_to @scout_team
    else
      render "edit"
    end
  end
  
  def destroy
    ScoutTeam.find(params[:id]).destroy
    redirect_to scout_teams_path
  end
end
