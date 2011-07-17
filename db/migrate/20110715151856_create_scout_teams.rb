class CreateScoutTeams < ActiveRecord::Migration
  def self.up
    create_table :scout_teams do |t|
      t.string :name
      t.string :body
      t.string :photo
      t.string :team_leader
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :scout_teams
  end
end
