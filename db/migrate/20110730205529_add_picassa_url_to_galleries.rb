class AddPicassaUrlToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :picassa_address, :string
  end

  def self.down
    remove_column :galleries, :picassa_address
  end
end
