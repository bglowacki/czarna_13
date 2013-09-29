class IdeasController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params[:idea])
    if @idea.save
      redirect_to ideas_path
    else
      render "new"
    end
  end

  def destroy
    Idea.find(params[:id]).destroy
    redirect_to ideas_path
  end
end
