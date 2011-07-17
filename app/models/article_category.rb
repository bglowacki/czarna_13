class ArticleCategory < ActiveRecord::Base
  has_many :article_sub_categories
end
