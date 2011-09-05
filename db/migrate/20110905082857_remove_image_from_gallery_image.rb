class RemoveImageFromGalleryImage < ActiveRecord::Migration
  def self.up
    remove_column :gallery_images, :image
  end

  def self.down
    add_column :gallery_images, :image, :string
  end
end
