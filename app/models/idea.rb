class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :added_by, presence: true
end
