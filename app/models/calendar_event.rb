class CalendarEvent < ActiveRecord::Base
  attr_accessible :title, :from, :to, :note

  validates :title, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
