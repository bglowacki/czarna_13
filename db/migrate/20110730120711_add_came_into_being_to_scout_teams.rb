class AddCameIntoBeingToScoutTeams < ActiveRecord::Migration
  def self.up
    add_column :scout_teams, :came_into_being, :date
  end

  def self.down
    remove_column :scout_teams, :came_into_being
  end
end
