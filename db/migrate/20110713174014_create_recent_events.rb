class CreateRecentEvents < ActiveRecord::Migration
  def self.up
    create_table :recent_events do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :recent_events
  end
end
