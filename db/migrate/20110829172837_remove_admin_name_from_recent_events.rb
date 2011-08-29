class RemoveAdminNameFromRecentEvents < ActiveRecord::Migration
  def self.up
    remove_column :recent_events, :admin_name
  end

  def self.down
    add_column :recent_events, :admin_name, :string
  end
end
