class Gallery < ActiveRecord::Base
  has_many :gallery_images, :dependent => :destroy
end
