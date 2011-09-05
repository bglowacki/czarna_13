class Gallery < ActiveRecord::Base
  has_many :gallery_images, :dependent => :destroy
  has_attached_file :image, :styles => { :medium => "175x175>"}
  
end
