class Idea < ActiveRecord::Base
  attr_accessible :title, :description, :added_by
  validates :title, presence: true
  validates :description, presence: true
  validates :added_by, presence: true
end
