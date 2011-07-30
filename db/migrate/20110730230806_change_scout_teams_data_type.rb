class ChangeScoutTeamsDataType < ActiveRecord::Migration
  def self.up
    change_column :scout_teams, :body, :text
  end

  def self.down
    change_column :scout_teams, :body, :string
  end
end
