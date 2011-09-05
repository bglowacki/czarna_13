class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  has_attached_file :image, :styles => {:thumb => "120x120>" }
end
