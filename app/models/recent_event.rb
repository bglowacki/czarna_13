class RecentEvent < ActiveRecord::Base
  belongs_to :admin

  validates :title, presence: true
  validates :description, presence: true
  validates :admin_id, presence: true
end
