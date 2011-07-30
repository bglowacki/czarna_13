class ScoutTeam < ActiveRecord::Base
  has_many :scout_team_members
  
  #scope :came_into_being_order, order => 'came_into_being ASC'
end
