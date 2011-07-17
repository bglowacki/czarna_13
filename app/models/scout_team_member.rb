class ScoutTeamMember < ActiveRecord::Base
  belongs_to :scout_team, :dependant => 'destroy'
end
