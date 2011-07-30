class AddSidekickToScoutTeams < ActiveRecord::Migration
  def self.up
    add_column :scout_teams, :sidekick, :string
  end

  def self.down
    remove_column :scout_teams, :sidekick
  end
end
