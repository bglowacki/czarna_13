class AddMeetingTimeFromAndMeetingTimeToToScoutTeam < ActiveRecord::Migration
  def self.up
    add_column :scout_teams, :meeting_time, :time
    add_column :scout_teams, :meeting_day, :string
    
  end

  def self.down
    remove_column :scout_teams, :meeting_time
    remove_column :scout_teams, :meeting_day
    
  end
end
