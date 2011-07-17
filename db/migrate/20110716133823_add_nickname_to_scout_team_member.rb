class AddNicknameToScoutTeamMember < ActiveRecord::Migration
  def self.up
    add_column :scout_team_members, :nickname, :string
  end

  def self.down
    remove_column :scout_team_members, :nickname
  end
end
