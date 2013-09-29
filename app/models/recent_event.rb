class RecentEvent < ActiveRecord::Base
  attr_accessible :title, :description
  belongs_to :admin

  validates :title, presence: true
  validates :description, presence: true
  validates :admin_id, presence: true
end
