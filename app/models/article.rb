class Article < ActiveRecord::Base
  attr_accessible :title, :body, :author
  belongs_to :article_sub_category
  validates :title, :presence => true
  validates :body, :presence => true
  validates :author, :presence => true
  validates :article_sub_category_id, :presence => true
end
