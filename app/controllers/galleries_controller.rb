class GalleriesController < ApplicationController
  
  def show
    @gallery = Gallery.find(params[:id])    
  end
  
  def index
    @galleries = Gallery.all
  end
  
  def new
    @gallery = Gallery.new
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
  
  def download
    send_file @gallery_image.download.path, :type => 'image/jpg', :filename => @gallery_image.permalink
  end  
end
