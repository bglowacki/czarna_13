class ArticleCategory < ActiveRecord::Base
  attr_accessible :name, :description, :image
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  has_many :article_sub_categories, :dependent => :destroy
end
