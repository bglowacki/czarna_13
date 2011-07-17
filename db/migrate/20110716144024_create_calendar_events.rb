class CreateCalendarEvents < ActiveRecord::Migration
  def self.up
    create_table :calendar_events do |t|
      t.string :title
      t.datetime :from
      t.datetime :to
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_events
  end
end
