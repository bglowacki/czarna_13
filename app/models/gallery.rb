class Gallery < ActiveRecord::Base
  attr_accessible :name, :description, :picassa_address, :image_file_name, :image_content_type, :image_files_size, :image_updated_at

  has_many :gallery_images, :dependent => :destroy
  has_attached_file :image, :styles => { :medium => "175x175>"}

  validates :name, presence: true
  validates :description, presence: true
  validates :picassa_address, presence: true
end
