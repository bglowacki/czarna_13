class GalleryImagesController < ApplicationController
  
  before_filter :authenticate_admin!, :only => [:new, :destroy]
  layout :resolve_layout
  
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @gallery_image = @gallery.gallery_images.build
    
  end
  
  def create
     @gallery = Gallery.find(params[:gallery_id])
     @gallery_image = @gallery.gallery_images.build(params[:gallery_image])
     if @gallery_image.save
       redirect_to gallery_path(@gallery)
     else
       render "new"
     end
   end
  
  def destroy
    @gallery_image = GalleryImage.find(params[:id])
    @gallery_image.destroy
    redirect_to gallery_path(@gallery.gallery_id)
  end
  
  def show
    @gallery_image = GalleryImage.find(params[:id])
  end
  
  def resolve_layout
    if action_name == "show"
      "gallery_image"
    else
      "application"
    end
  end
  
  
end
