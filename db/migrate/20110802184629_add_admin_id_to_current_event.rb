class AddAdminIdToCurrentEvent < ActiveRecord::Migration
  def self.up
    add_column :recent_events, :admin_name, :string
  end

  def self.down
    remove_column :recent_events, :admin_name
  end
end
