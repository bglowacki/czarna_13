class ScoutTeam < ActiveRecord::Base
  has_many :scout_team_members
  
  validates :name, :presence => true
  
end
