class ScoutTeamMembersController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:edit, :destroy]
  
  def new
    @scout_team = ScoutTeam.find(params[:scout_team_id])
    @scout_team_member = @scout_team.scout_team_members.build
  end
  
  def create
    @scout_team = ScoutTeam.find(params[:scout_team_id])
    @scout_team_member = @scout_team.scout_team_members.build(params[:scout_team_member])
    
    if @scout_team_member.save
      redirect_to scout_team_member_path(@scout_team_member)
    else
      render "new"
    end
  end
  
  def index
    @scout_team_members = ScoutTeamMember.all
  end
  
  def show
    @scout_team_member = ScoutTeamMember.find(params[:id])
  end
  
  def edit
    @scout_team_member = ScoutTeamMember.find(params[:id])
  end  
  
  def update
    @scout_team_member = ScoutTeamMember.find(params[:id])
    if @scout_team_member.update_attributes(params[:scout_team_member])
      redirect_to @scout_team_member
    else
      render "edit"
    end
  end
  
  def destroy
    @scout_team_member = ScoutTeamMember.find(params[:id])
    @scout_team_member.destroy
    redirect_to scout_team_path(@scout_team_member.scout_team_id)
  end
  
  
end
