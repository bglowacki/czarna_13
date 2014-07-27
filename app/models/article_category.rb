class ArticleCategory < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  has_many :article_sub_categories, :dependent => :destroy
end
