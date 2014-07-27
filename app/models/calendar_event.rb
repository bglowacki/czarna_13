class CalendarEvent < ActiveRecord::Base

  validates :title, presence: true
  validates :from, presence: true
  validates :to, presence: true
end
