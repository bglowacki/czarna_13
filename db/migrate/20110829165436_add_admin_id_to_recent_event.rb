class AddAdminIdToRecentEvent < ActiveRecord::Migration
  def self.up
    add_column :recent_events, :admin_id, :integer
  end

  def self.down
    remove_column :recent_events, :admin_id
  end
end
