class CreateScoutTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :scout_team_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :rank
      t.integer :scout_team_id
      t.string :instructor_rank

      t.timestamps
    end
  end

  def self.down
    drop_table :scout_team_members
  end
end
