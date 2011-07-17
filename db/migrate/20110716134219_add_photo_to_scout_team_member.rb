class AddPhotoToScoutTeamMember < ActiveRecord::Migration
  def self.up
    add_column :scout_team_members, :photo, :string
  end

  def self.down
    remove_column :scout_team_members, :photo
  end
end
