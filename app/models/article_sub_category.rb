class ArticleSubCategory < ActiveRecord::Base
  belongs_to :article_category
  has_many :articles, :dependent => :destroy
end
