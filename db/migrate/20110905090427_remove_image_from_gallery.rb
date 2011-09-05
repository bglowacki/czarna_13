class RemoveImageFromGallery < ActiveRecord::Migration
  def self.up
    remove_column :galleries, :image
  end

  def self.down
    add_column :galleries, :image, :string
  end
end
