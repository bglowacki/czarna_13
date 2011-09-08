class GalleriesController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :destroy]
  
  def show
    @gallery = Gallery.find(params[:id])    
  end
  
  def index
    @galleries = Gallery.all
  end
  
  def new
    @gallery = Gallery.new
  end
  
  def edit
    @gallery = Gallery.find(params[:id])
  end
  
  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to gallery_path(@gallery)
    else
      render "edit"
    end
  end
  
  def create
    @gallery = Gallery.new(params[:gallery])

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render "new"
    end
  end
  
  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to galleries_path
  end
  
end
